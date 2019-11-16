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
        $OrderBy = 'p.id DESC';
        return $Data = $this->DB->GetAll('SELECT
                  p.id,p.price,t.car_model,t.car_title,t.car_class,t.car_bstyle,t.car_transmission, v.airconditions, i.photo_name
                  FROM cars p
                  LEFT JOIN cars_trans t ON t.car_id = p.id
                  LEFT JOIN car_photos i ON i.car_id = p.id
                  LEFT JOIN car_features v ON v.car_id = p.id
                  WHERE t.lang_id = ?i AND p.status = 1 
                  ORDER BY ' . $OrderBy, 
                  Lang::GetLangID()
                );
    }

}