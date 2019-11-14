<?php


class MainModel extends Model
{
	

	function __construct()
	{
		parent::__construct();
		$this->Params['slider'] = $this->GetSlider();
	}

	public function GetSlider()
	{	

		return	$this->DB->GetAll('SELECT
                                  s.*,
                                  t.slider_html, t.slider_caption, t.slider_link
                                  FROM slider s
                                  LEFT JOIN slider_trans t ON t.slider_id = s.slider_id
                                  WHERE t.slider_lang = ?i
                                  ORDER BY slider_order ASC ', Lang::GetLangID());

	}

	public function getLastNews($Limit = 2)
	{
		return  $this->DB->GetAll("SELECT
                                  news.*,
                                  t.title,
                                  t.text,
                                  t.moretext,
                                  i.content_photo_name as image
                                  FROM
                                  news
                                  LEFT JOIN news_trans as t ON t.content = news.id AND t.lang_id = ?i
                                  LEFT JOIN news_photos as i ON i.content_id = news.id AND i.content_photo_cover = 1
                                  WHERE news.published = 1
                                  ORDER BY news.published_date DESC
                                  LIMIT ?i", Lang::GetLangID(), $Limit);

	}

    public function GetPartners()
    {
        return $this->DB->GetAll('SELECT * FROM partners ORDER BY ordering');
    }

    public function CategoriesSlider()
    {
        return $this->DB->GetAll('SELECT
                                  c.category_id,
                                  c.image,
                                  t.title,
                                  COUNT(DISTINCT pc.product_id)  as count
                                  FROM product_categories c
                                  LEFT JOIN product_categories_trans t ON t.category_id = c.category_id AND t.lang_id = ?i
                                  LEFT JOIN product_to_categories pc ON pc.category_id = c.category_id
                                  LEFT JOIN products p ON p.product_id = pc.product_id 
                                  WHERE p.status_id = 1
                                  GROUP BY c.category_id
                                  ORDER BY `count` DESC', Lang::GetLangID());
    }

    public function GetProducts($Type, $Limit)
    {
        $Where = '';
        $OrderBy = '';
        if($Type == 1)
            $OrderBy = 'p.views DESC';
        if($Type == 2){
            $OrderBy = 'sale DESC, rand()';
            $Where = ' AND IF(v.variant_id, v.sale, p.sale) > 0';
        }
        if($Type == 3){
            $OrderBy = 'p.product_id DESC';
        }
        if($Type == 4){
            $OrderBy = 'rand()';
            $Where = ' AND p.featured = 1';
        }
        return  $this->DB->GetAll('SELECT
									p.product_id,
									IF(v.variant_id, v.sale, p.sale) AS sale,
									IF(v.variant_id, v.sale_end_date, p.sale_end_date) AS sale_end_date,
									IF(v.variant_id, v.price, p.price) AS price,
									IF(v.variant_id, v.quantity, p.quantity) AS quantity,
									v.variant_id,
									IF(vi.photo_id, i2.photo_name, i.photo_name) AS image,
									t.title,
									CEIL(time_to_sec(timediff(p.created_date, now()))/3600/24) as days_left
									FROM products p
									LEFT JOIN products_trans t ON t.product_id = p.product_id
									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1
									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1
									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id
									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id 
									WHERE t.lang_id = ?i AND p.status_id = 1 ' . $Where . '
									GROUP BY p.product_id ORDER BY ' . $OrderBy . ' LIMIT ' . $Limit, Lang::GetLangID());
    }

}