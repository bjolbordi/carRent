<?php

class ProductModel extends Model
{
    public $Count = 0;

	function __construct()
	{
		parent::__construct();
	}

    public function GetSlider()
    {
        if(Request::Get('category') && !Request::Get('brand')){
            return	$this->DB->GetAll('SELECT
                                  s.*,
                                  t.slider_html, t.slider_caption, t.slider_link
                                  FROM slider s
                                  LEFT JOIN slider_trans t ON t.slider_id = s.slider_id
                                  INNER JOIN slider_to_categories c ON c.slider_id = s.slider_id AND c.category_id = ?i
                                  WHERE t.slider_lang = ?i 
                                  ORDER BY slider_order ASC ', (int)Request::Get('category'), Lang::GetLangID());
        }else{
            $BrandQuery = 'AND c.category_id IS NULL';
            if(Request::Get('brand')){
                $BrandQuery = ' AND s.brand_id = ' . (int)Request::Get('brand');
            }
            return	$this->DB->GetAll('SELECT
                                  s.*,
                                  t.slider_html, t.slider_caption, t.slider_link
                                  FROM slider s
                                  LEFT JOIN slider_trans t ON t.slider_id = s.slider_id
                                  LEFT JOIN slider_to_categories c ON c.slider_id = s.slider_id
                                  WHERE t.slider_lang = ?i ' . $BrandQuery . ' 
                                  ORDER BY slider_order ASC ', Lang::GetLangID());
        }
    }

    public function SimilarProducts($Id, $Limit = 8)
    {
        /*$Tags = $this->DB->GetAll('SELECT tag_id FROM product_to_tags WHERE product_id = ?i', $Id);
        $Where = '';
        $i = 0;
        foreach ($Tags as $Key => $Val){
            if($i)
                $Where .= ' AND SUM(tg.tag_id = '.$Val["tag_id"].') > 0 ';
            else
                $Where = 'HAVING SUM(tg.tag_id = '.$Val["tag_id"].') > 0 ';
            $i++;
        }*/

        //Functions::Pre($Tags);
        $Data = $this->DB->GetAll('SELECT 
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
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default= 1
									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1
									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id
									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id
									INNER JOIN product_to_tags tg ON tg.product_id = p.product_id
									WHERE p.status_id = 1 AND p.product_id != ?i AND tg.tag_id IN(SELECT tag_id FROM product_to_tags WHERE product_id = ?i)
									GROUP BY p.product_id 
									ORDER BY rand() LIMIT '. $Limit, Lang::GetLangID(), $Id, $Id);
        return $Data;
    }

    public function HistoryProducts($Id, $Limit = 8)
    {
        $History = json_decode(Cookie::Get('history'), true);
        krsort($History);
        $In = implode(',', $History);
        $Data = [];
        if(count($History)){
            $Data = $this->DB->GetAll('SELECT 
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
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default= 1
									LEFT JOIN product_photos i ON i.content_id = p.product_id AND i.ordering = 1
									LEFT JOIN products_variant_photos vi ON vi.variant_id = v.variant_id
									LEFT JOIN product_photos i2 ON i2.photo_id = vi.photo_id
									WHERE  p.status_id = 1 AND p.product_id != ?i AND p.product_id IN ('.$In.')
									GROUP BY p.product_id 
									ORDER BY rand() LIMIT '. $Limit, Lang::GetLangID(), $Id);
        }
        return $Data;
    }

	public function GetProducts($Page, $PerPage)
	{

        /*$Where = $this->BuildQuery();
        $Order = $this->BuildOrderQuery();*/

       /* $Default = '';
        if(Request::Get('color') == '' && Request::Get('attr') == '' && Request::Get('price_from') == '' && Request::Get('price_to') == '')
            $Default = ' AND v.default = 1';*/

        $Start = $Page ? $PerPage * ($Page - 1) : 1;
        $Limit = ' LIMIT ' . $Start . ', ' . $PerPage . '';

        $Data = $this->DB->GetAll('SELECT SQL_CALC_FOUND_ROWS
									p.id,
									FROM cars p
									LEFT JOIN cars_trans t ON t.car_id = p.id
									LEFT JOIN car_photos i ON i.car_id = p.id
									LEFT JOIN car_features v ON v.car_id = p.id
									WHERE t.lang_id = ?i AND p.status = 1 
									
									GROUP BY p.id ORDER BY '. $Limit, Lang::GetLangID());

        $this->Count = $this->DB->GetOne('SELECT FOUND_ROWS()');
        return $Data;
	}

	private function BuildQuery($Price = false)
    {
        $Where = '';
        if((int)Request::Get('category')){
            $Where .= ' AND c.category_id = ' . (int)Request::Get('category');
        }
        // word
        if(Request::Get('word') && strlen(Request::Get('word')) > 2){
            $Where .= ' AND t.title LIKE "%' . Request::Get('word') .'%"';
        }
        // brand
        if((int)Request::Get('brand')){
            $Where .= ' AND b.brand_id = ' . (int)Request::Get('brand');
        }
        if(!$Price){
            // price
            if(Request::Get('price_from')){
                $Where .= ' AND IF(v.variant_id,  v.price, p.price) >= "' . (int)Request::Get('price_from').'"';
            }
            if(Request::Get('price_to')){
                $Where .= ' AND IF(v.variant_id,  v.price, p.price)  <= "' . (int)Request::Get('price_to').'"';
            }
        }
        if(Request::Get('attr')){
            $gets = explode(",",Request::Get('attr'));
           $Where .= ' AND pva.variant_id IN (SELECT 
                                    pva.variant_id
                                    FROM
                                    products_variant_attrs pva
                                    WHERE pva.attr_value_id IN('.Request::Get('attr').')
                                    GROUP BY pva.variant_id
                                    HAVING count(pva.variant_id) = '.count($gets).')';
        }
        if(Request::Get('color')){
            $gets = explode(",",Request::Get('color'));
            $Where .= ' AND pva.variant_id IN (SELECT 
                                    pva.variant_id
                                    FROM
                                    products_variant_attrs pva
                                    inner join attr_values av on pva.attr_value_id = av.attr_value_id
                                    WHERE av.color_id IN('.Request::Get('color').')
                                    GROUP BY pva.variant_id
                                    HAVING count(pva.variant_id) = '.count($gets).')';
        }
        // in stock
        if((int)Request::Get('stock') === 1){
            $Where .= ' AND IF(v.variant_id,  v.quantity, p.quantity) > 0';
        }
        elseif((int)Request::Get('stock') == 2){
            $Where .= ' AND IF(v.variant_id,  v.quantity, p.quantity) = 0';
        }
        else{
            $Where .= '';
        }
        return $Where;
    }

    private function BuildOrderQuery()
    {
        $Order = ' p.views DESC';
        if(Request::Get('sort')){
            $Array = explode(',', Request::Get('sort'));
            if(count($Array) == 2 && in_array($Array[0], ['price','views']) && in_array($Array[1], ['asc','desc'])){
                if($Array[0] == 'views'){
                    $Order = ' p.views ' . $Array[1];
                }
                if($Array[0] == 'price'){
                    $Order = ' IF(v.price,  v.price, p.price) ' . $Array[1];
                }
            }
        }
        return $Order;
    }

	public function GetProduct($ProductId)
	{
        
        
        
        return $this->DB->GetRow('SELECT
                                    *
									FROM cars p
                                    LEFT JOIN cars_trans t ON t.car_id = p.id
                                    LEFT JOIN car_photos i ON i.car_id = p.id
                                    LEFT JOIN car_features v ON v.car_id = p.id
                                    WHERE t.lang_id = ?i AND p.id = ?i AND p.status = 1',
                                    Lang::GetLangID(), 
                                    (int)$ProductId
                                );
	}

    public function GetImages($Id, $VariantId)
    {
        $Images = [];
        if($VariantId){
            $Images = $this->DB->GetAll('SELECT
									p.*,
									vp.variant_id
									FROM products_variant_photos vp
									LEFT JOIN product_photos p ON p.photo_id = vp.photo_id
									WHERE vp.variant_id = ?i
									ORDER BY p.ordering ASC', $VariantId);
        }
        if(count($Images) == 0){
            return $this->DB->GetAll('SELECT
									p.*
									FROM product_photos p
									WHERE p.content_id = ?i
									ORDER BY p.ordering ASC', $Id);
        }else{
            return $Images;
        }

    }

    public function GetVariant($VariantId)
    {
        if(!$VariantId)
            return [];
        return $this->DB->GetRow('SELECT
                                    v.variant_id,
                                    v.product_id,
                                    v.price,
                                    v.sale,
                                    v.sale_end_date,
                                    v.quantity,
                                    v.sku,
                                    v.default
                                    FROM
                                    products_variants as v
                                    WHERE v.variant_id = ?i', $VariantId);

    }

    public function GetAttr($ProductId)
    {
        if(!$ProductId)
            return [];
        $Array = [];
        $Data = $this->DB->GetAll('SELECT 
                                    v.product_id,
                                    pva.variant_id,
                                    pva.attr_value_id,
                                    at.title as attr_title,
                                    attrs.attr_id,
                                    av.color,
                                    avt.title
                                    FROM
                                    products_variant_attrs pva
                                    LEFT JOIN products_variants v ON v.variant_id = pva.variant_id
                                    LEFT JOIN attr_values av ON av.attr_value_id = pva.attr_value_id
                                    INNER JOIN attr_values_trans avt ON av.attr_value_id = avt.attr_value_id AND avt.lang_id = ?i 
                                    LEFT JOIN attrs ON av.attr_id = attrs.attr_id
                                    INNER JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = ?i
                                    WHERE v.product_id = ?i
                                    GROUP BY av.attr_value_id ORDER BY attrs.ordering ASC, av.ordering ASC ',Lang::GetLangID(), Lang::GetLangID(), $ProductId);

        foreach ($Data as $Attr){
            $Array[$Attr['attr_title']][] = $Attr;
        }
        return $Array;
    }

    public function GetVariantAttr($VariantId)
    {
        if(!$VariantId)
            return [];
        $Array = [];
        $Data = $this->DB->GetAll('SELECT 
                                    pva.attr_value_id
                                    FROM
                                    products_variant_attrs pva
                                    WHERE pva.variant_id = ?i', $VariantId);

        foreach ($Data as $Attr){
            $Array[] = $Attr['attr_value_id'];
        }
        return $Array;
    }

    public function SaveHistory($ProductId)
    {
        $History = json_decode(Cookie::Get('history'), true);
        if(!is_array($History)){
            $History = [$ProductId];
        }else{
            if(is_array($History[0]))
                $History = [];
            $NewHistory = $ProductId;
            if(!in_array($NewHistory, $History))
                $History[] = $NewHistory;
            else{
                if(($key = array_search($NewHistory, $History)) !== false) {
                    unset($History[$key]);
                    $History[] = $NewHistory;

                }
            }
        }

        if(count($History) > 20)
            $History = array_slice($History, 1);
        Cookie::Set('history', json_encode($History), time() + 60*60*24*365, '/');
    }

    public function UpdateViews($ProductId)
    {
        $this->DB->Query('UPDATE products SET views=views+1 WHERE product_id = ?i', $ProductId);
    }

    public function GetVariantId($Post){


        if(!$Post['product_id'] || count($Post['attrs']) == 0){
            $this->SetResult(false, 'Product Not Found');
            return $this->Result;
        }
        $In = implode(',', $Post['attrs']);

        $Data = $this->DB->GetRow('SELECT 
                                    pva.variant_id
                                    FROM
                                    products_variant_attrs pva
                                    WHERE pva.product_id = ?i AND pva.attr_value_id IN('.$In.')
                                    GROUP BY pva.variant_id
                                    HAVING(count(pva.variant_id) = ?i)
                                    ', $Post['product_id'], count($Post['attrs']));



        $this->SetResult(true, 'Success', $Data['variant_id']);
        return $this->Result;
    }

    public function GetFilterUrl()
    {
        Request::UnSetGet('url');
        return http_build_query(Request::Get());
    }

    public function GetFilterCategories()
    {
        $Where = $this->BuildQuery();

        $Data = $this->DB->GetAll('SELECT 
									c.category_id,
									ct.title,
									COUNT(DISTINCT p.product_id) as count
									FROM products p
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.product_id = p.product_id
									LEFT JOIN product_to_categories c ON c.product_id = p.product_id
									LEFT JOIN product_categories_trans ct ON ct.category_id = c.category_id
									LEFT JOIN products_variant_attrs pva ON pva.variant_id = v.variant_id
									LEFT JOIN brands b ON b.brand_id = p.brand_id
									WHERE ct.lang_id = ?i AND p.status_id = 1 
									'.$Where.'
									GROUP BY c.category_id ', Lang::GetLangID(), Lang::GetLangID());

        return $Data;
    }

    public function GetFilterBrands()
    {
        $Where = $this->BuildQuery();

        $Data = $this->DB->GetAll('SELECT 
									b.brand_id,
									b.title,
									COUNT(DISTINCT p.product_id) as count
									FROM products p
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.product_id = p.product_id
									LEFT JOIN product_to_categories c ON c.product_id = p.product_id
									LEFT JOIN products_variant_attrs pva ON pva.variant_id = v.variant_id
									LEFT JOIN brands b ON b.brand_id = p.brand_id
									WHERE  p.status_id = 1 AND b.brand_id > 0
									'.$Where.' 
									GROUP BY b.brand_id ', Lang::GetLangID());
        //Functions::Pre($Where);
        return $Data;
    }

    public function GetFilterStock()
    {
        $Where = $this->BuildQuery();

        $Default = '';
        if(Request::Get('color') == '' && Request::Get('attr') == '' && Request::Get('price_from') == '' && Request::Get('price_to') == '')
            $Default = ' AND v.default = 1';

        $Data = $this->DB->GetAll('SELECT  
                                    CASE 
                                        WHEN (v.variant_id AND v.quantity > 0) OR (v.variant_id IS NULL AND p.quantity > 0)  then 1
                                        WHEN (v.variant_id AND v.quantity = 0) OR (v.variant_id IS NULL AND p.quantity = 0)  then 2
                                        ELSE 3
                                    END as stock,
									count(DISTINCT  p.product_id) as qty
									FROM products p
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.product_id = p.product_id '.$Default.'
									LEFT JOIN product_to_categories c ON c.product_id = p.product_id
									LEFT JOIN products_variant_attrs pva ON pva.variant_id = v.variant_id
									LEFT JOIN brands b ON b.brand_id = p.brand_id
									WHERE p.status_id = 1
									'.$Where.' 
									GROUP BY stock
									', Lang::GetLangID());
        return $Data;
    }
    public function GetFilterPrice()
    {
        $Where = $this->BuildQuery(true);

        $Data = $this->DB->GetRow('SELECT 
                                    min(
                                    case 
                                        when v.variant_id and v.sale > 0  and (v.sale_end_date >= now() or v.sale_end_date is null) then v.sale 
                                        when v.variant_id is null and p.sale > 0 and (p.sale_end_date >= now() or p.sale_end_date is null) then p.sale 
                                        when v.variant_id and (v.sale = 0 or v.sale_end_date < now()) then v.price 
                                        when v.variant_id is null and (p.sale = 0 or p.sale_end_date < now()) then p.price 
                                        else 0
                                    end) as min_price,
                                    max(
                                    case 
                                        when v.variant_id and v.sale > 0  and (v.sale_end_date >= now() or v.sale_end_date is null) then v.sale 
                                        when v.variant_id is null and p.sale > 0 and (p.sale_end_date >= now() or p.sale_end_date is null) then p.sale 
                                        when v.variant_id and (v.sale = 0 or v.sale_end_date < now()) then v.price 
                                        when v.variant_id is null and (p.sale = 0 or p.sale_end_date < now()) then p.price 
                                        else 0
                                    end) as max_price
                                   FROM products p
                                    LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
                                    LEFT JOIN products_variants v ON v.product_id = p.product_id
                                    LEFT JOIN product_to_categories c ON c.product_id = p.product_id
                                    LEFT JOIN products_variant_attrs pva ON pva.variant_id = v.variant_id
                                    LEFT JOIN brands b ON b.brand_id = p.brand_id
                                    WHERE  p.status_id = 1 
									'.$Where.' 
									', Lang::GetLangID());
        //Functions::Pre($Data);
        return $Data;
    }
    public function GetFilterAttrs()
    {
        $Where = $this->BuildQuery();
        $Array = [];
        $Data = $this->DB->GetAll('SELECT 
                                    pva.attr_value_id,
                                    avt.title,
                                    av.color,
                                    at.title as attr_title, 
                                    attrs.attr_id,
                                    count(distinct p.product_id) as count
                                    FROM
                                    products_variant_attrs pva
                                    inner JOIN products_variants v ON v.variant_id = pva.variant_id
                                    inner join products p on v.product_id = p.product_id
                                    inner join products_trans t on t.product_id = p.product_id AND t.lang_id = ?i
                                    LEFT JOIN product_to_categories c ON c.product_id = p.product_id
                                    LEFT JOIN brands b ON b.brand_id = p.brand_id
                                    LEFT JOIN attr_values av ON av.attr_value_id = pva.attr_value_id
                                    left JOIN attr_values_trans avt ON av.attr_value_id = avt.attr_value_id AND avt.lang_id = ?i 
                                    LEFT JOIN attrs ON av.attr_id = attrs.attr_id
                                    INNER JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = ?i
                                    WHERE p.status_id = 1 AND av.color_id = 0 
									'.$Where.' 
									GROUP BY pva.attr_value_id
									ORDER BY attrs.ordering, av.ordering', Lang::GetLangID(), Lang::GetLangID(), Lang::GetLangID());

        foreach ($Data as $Attr){
            $Array[$Attr['attr_title']][] = $Attr;
        }
        return $Array;
    }
    public function GetFilterColors()
    {
        $Where = $this->BuildQuery();
        $Array = [];
        $Data = $this->DB->GetAll('SELECT 
                                    pva.attr_value_id,
                                    ct.title,
                                    co.color,
                                    co.color_id,
                                    count(distinct p.product_id) as count
                                    FROM
                                    products_variant_attrs pva
                                    inner JOIN products_variants v ON v.variant_id = pva.variant_id
                                    inner join products p on v.product_id = p.product_id
                                    inner join products_trans t on t.product_id = p.product_id AND t.lang_id = ?i
                                    LEFT JOIN product_to_categories c ON c.product_id = p.product_id
                                    LEFT JOIN brands b ON b.brand_id = p.brand_id
                                    LEFT JOIN attr_values av ON av.attr_value_id = pva.attr_value_id
                                    LEFT JOIN attrs ON av.attr_id = attrs.attr_id
                                    LEFT JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = ?i
                                    LEFT JOIN colors co ON av.color_id = co.color_id
                                    LEFT JOIN colors_trans ct ON ct.color_id = co.color_id AND ct.lang_id = ?i
                                    WHERE p.status_id = 1 AND attrs.type_id = 2 AND av.color_id > 0
									'.$Where.' 
									GROUP BY co.color_id
									ORDER BY attrs.ordering, av.ordering', Lang::GetLangID(), Lang::GetLangID(), Lang::GetLangID());

        foreach ($Data as $Attr){
            $Array[Lang::Get('color')][] = $Attr;
        }
        return $Array;
    }
}