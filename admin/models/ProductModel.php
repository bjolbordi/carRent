<?php

class ProductModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

    public function GetItems()
    {
        $Where = '';
        $Word = Request::Get('word');
        if($Word)
            $Where = 'AND t.title LIKE "%' . $Word . '%" ';
        if(is_numeric($Word))
            $Where = 'AND p.id = '.$Word.'';
        $Limit = Functions::PageLimits(CONTENT_PER_PAGE);

        $Data = $this->DB->GetAll('SELECT SQL_CALC_FOUND_ROWS
									p.id,
									p.status,
									p.views,
									p.created_at,
									i.photo_name as image,
									t.car_title,
									t.lang_id
									FROM cars p
									LEFT JOIN cars_trans t ON t.car_id = p.id
									LEFT JOIN car_features v ON v.car_id = p.id
									LEFT JOIN car_photos i ON i.car_id = p.id
									WHERE t.lang_id = 1 AND p.status != 0 ' . $Where . '
									GROUP BY p.id
									ORDER BY p.id DESC ' . $Limit);
        $this->Params['ContentCount'] = $this->DB->GetOne('SELECT found_rows()');
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetItemData($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									p.*,
									t.title,
									t.desc,
									t.lang_id
									FROM products p
									LEFT JOIN products_trans t ON t.product_id = p.product_id
									WHERE p.product_id = ?i', (int)$Id);
        foreach($Data as $val){
            $Array[$val['lang_id']] = $val;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

    public function GetItemImages($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									p.*
									FROM product_photos p
									WHERE p.content_id = ?i
									ORDER BY p.ordering ASC', $Id);
        foreach($Data as $val){
            $Array[$val['photo_id']] = $val;
            $Path = UPLOAD_PATH . 'product/l_' . $val['photo_name'];
            $Size = @filesize($Path);
            $Array[$val['photo_id']]['size'] = $Size;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }




    public function GetVariantImages($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									p.*
									FROM products_variant_photos p
									WHERE p.variant_id = ?i', $Id);
        foreach($Data as $val){
            $Array[$val['photo_id']] = $val;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

    public function Generate($Id)
    {
        $Product = $this->DB->GetRow('SELECT
									p.*
									FROM products p
									WHERE p.product_id = ?i', $Id);
        $Variants = $this->GetVariants($Id)['Data'];
        $ExistingCombinationsIds = array_map(function ($o) {
            return $o['variant_id'];
        }, $Variants);

        $Attr = explode(',', Request::Post('attr'));
        $Array = [];
        foreach ($Attr as $a){
            $b = explode('|', $a);
            if(is_numeric($b[0])){
                $AttrId = $this->DB->GetOne('SELECT attr_id FROM attr_values  WHERE attr_value_id = ?i', $b[0]);
                $Array[$AttrId][$b[0]] = $b[0];
            }
        }
        $Combinations = $this->createCombinations(array_values($Array));
        //Functions::Pre($Combinations);
        $i = 1;
        foreach ($Combinations as $Value){
            $Default = 0;
            if(!$Variants && $i == 1)
                $Default = 1;
            // Check unique attr
            if($this->CheckAttr($Id, $Value))
                continue;
            $this->DB->query('INSERT INTO products_variants SET product_id = ?i, quantity = ?i, price = ?s, sku = ?s, `default` = ?i',
                $Id, $Product['quantity'], $Product['price'], $Product['sku'], $Default);
            $VariantId = $this->DB->insertId();
            foreach ($Value as $AttrValueId){
                $this->DB->query('INSERT INTO products_variant_attrs SET product_id = ?i, variant_id = ?i, attr_value_id = ?i',
                    $Id, $VariantId, $AttrValueId);
            }
            $i++;
        }

        //Functions::Pre($Combinations);
        $this->SetResult(true, '', '');
        return $this->Result;
    }


    public function UploadImage($ProductId = false)
    {
        //Functions::Pre(Request::File('images'));
        $Result = ['error' => 'error'];
        $initialPreview = [];
        $initialPreviewConfig = [];
        if(Request::File('images')['name'] && is_numeric($ProductId)){
            $Image = new Image();
            $AllowedExts = ["jpeg", "jpg", "png", "JPG", "JPEG"];
            $i = 0;
            foreach(Request::File('images')['tmp_name'] as $TmpName){

                $Path = Request::File('images')['name'][$i];
                $Ext = pathinfo($Path, PATHINFO_EXTENSION);

                if (!in_array($Ext, $AllowedExts))
                {
                    return ['error' => 'Supported image formats  jpeg, jpg, png '];
                }

                $Microtime = ceil(microtime(false) * 1000).time();
                $ImagePath = UPLOAD_PATH . 'product/' .$Microtime . '.'. $Ext;
                if (move_uploaded_file($TmpName, $ImagePath))
                {
                    $ThumbPath = UPLOAD_PATH . 'product/';
                    $Image::createThumb($ImagePath, $ThumbPath, 'l_', PRODUCT_WIDTH_L, PRODUCT_HEIGHT_L, true, 90, '');
                    $Image::createThumb($ImagePath, $ThumbPath, 'm_', PRODUCT_WIDTH_M, PRODUCT_HEIGHT_M, true, 90, '');
                    $Image::createThumb($ImagePath, $ThumbPath, 's_', PRODUCT_WIDTH_S, PRODUCT_HEIGHT_S, true, 90, '');
                }
                $Ordering = $this->DB->GetOne('SELECT count(0) FROM product_photos  WHERE content_id = ?i', $ProductId);
                $this->DB->Query('INSERT INTO product_photos SET content_id = ?i, photo_name = ?s, ordering = ?i', $ProductId, $Microtime.'.'.$Ext, $Ordering+1);
                $PhotoId = $this->DB->insertId();
                $Path = UPLOAD_PATH . 'product/s_' . $Microtime.'.'.$Ext;
                $Size = @filesize($Path);
                $initialPreview[] = SITE_URL . 'upload/product/l_' . $Microtime.'.'.$Ext;
                $initialPreviewConfig[] = ['caption' => $Microtime.'.'.$Ext, 'size' => $Size, 'url' => URL . Lang::GetLang() . '/product/RemoveImage/' . $PhotoId, 'key' => $PhotoId];
                $i++;
            }

            $Result = [
                'success' => true,
                'initialPreview' => $initialPreview,
                'initialPreviewConfig' => $initialPreviewConfig
            ];

        }

        return $Result;
    }

    public function Insert($Post)
	{

       
		$Params['price'] = (isset($Post['price']) ? $Post['price'] : 0);
        $Params['status'] = 1;
        
		$this->DB->Query('INSERT INTO cars SET ?u ', $Params);
		$Id = $this->DB->insertId();
       
		foreach ($Post as $Lang => $Val) {
            
            
			if(is_array($Val)){
				$Val['lang_id'] = $Lang;
				$Val['car_id'] = $Id;
				$this->DB->Query('INSERT INTO cars_trans SET ?u', $Val);
			}
		}
        

		if(Request::File('images')['name']){
			$Image = new Image();
			$AllowedExts = ["jpeg", "jpg", "png", "JPG", "JPEG"];
			$i = 0;
			foreach(Request::File('images')['tmp_name'] as $TmpName){

				$Path = Request::File('images')['name'][$i];
				$Ext = pathinfo($Path, PATHINFO_EXTENSION);

				if (!in_array($Ext, $AllowedExts))
				{
					$this->SetResult(true, 'Supported image formats  jpeg, jpg, png ');
					return $this->Result;
				}

				$Microtime = ceil(microtime(false) * 1000).time();
				$ImagePath = UPLOAD_PATH . 'cars/' .$Microtime . '.'. $Ext;

                if(!is_dir(UPLOAD_PATH . 'cars/'))
                    mkdir(UPLOAD_PATH . 'cars/');

				if (move_uploaded_file($TmpName, $ImagePath))
				{
					$ThumbPath =  UPLOAD_PATH . 'cars/';
					$Image::createThumb($ImagePath, $ThumbPath, 'l_', NEWS_WIDTH_L, NEWS_HEIGHT_L, true, 90, '');
                    $Image::createThumb($ImagePath, $ThumbPath, 'm_', NEWS_WIDTH_M, NEWS_HEIGHT_M, false, 90, '');
					$Image::createThumb($ImagePath, $ThumbPath, 's_', NEWS_WIDTH_S, NEWS_HEIGHT_S, true, 90, '');
				}
				$this->DB->Query('INSERT INTO car_photos SET car_id = ?i, photo_name = ?s', $Id, $Microtime.'.'.$Ext);
				$i++;
			}

			//if(!$this->DB->GetOne('SELECT count(0) FROM car_photos  WHERE car_id = ?i AND photo_cover = 1', $Id))
				//$this->DB->Query('UPDATE car_photos SET content_photo_cover = 1 WHERE content_id = ?i LIMIT 1',$Id);

		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

    public function InsertItem()
    {
        $this->DB->Query('INSERT INTO products SET ?u', ['brand_id' => 0]);
        $Id = $this->DB->insertId();

        foreach (json_decode(LANGS, true) as $Lang) {
                $Val['lang_id'] = $Lang['id'];
                $Val['product_id'] = $Id;
                $this->DB->Query('INSERT INTO products_trans SET ?u', $Val);
        }

        $this->SetResult(true, 'Success', $Id);
        return $this->Result;
    }

    public function UpdateItem($Id, $Post)
    {
        foreach ($Post as $Lang => $Val) {
            if(is_array($Val) && isset($Val['title'])){
                $this->DB->Query('UPDATE products_trans SET ?u WHERE product_id = ?i AND lang_id = ?i', $Val, $Id, $Lang);
            }
        }

        $Item['price'] = $Post['price'];
        $Item['sale'] = $Post['sale'];
        $Item['sku'] = $Post['sku'];
        $Item['code'] = $Post['code'];
        $Item['quantity'] = (int)$Post['quantity'];
        $Item['brand_id'] = $Post['brand_id'];
        $Item['status_id'] = isset($Post['status_id']) ? $Post['status_id'] : 2;
        $Item['sale_end_date'] = $Post['sale_end_date'];
        $Item['featured'] = (isset($Post['featured']) ? 1 : 0);


        $this->DB->Query('UPDATE products SET ?u WHERE product_id = ?i', $Item, $Id);

        $this->DB->Query('DELETE FROM product_to_categories WHERE product_id = ?i', $Id);
        $this->DB->Query('DELETE FROM product_to_tags WHERE product_id = ?i', $Id);

        if(isset($Post['categories'])){
            foreach ($Post['categories'] as $CategoryId) {
                $this->DB->Query('INSERT INTO product_to_categories SET product_id = ?i, category_id = ?i', $Id, $CategoryId);
            }
        }
        if(isset($Post['tags'])){
            foreach (explode(',', $Post['tags']) as $Tag) {
                if(trim($Tag)){
                    $this->DB->Query('INSERT IGNORE INTO product_tags SET tag_name = ?s', trim($Tag));
                    $TagId = $this->DB->getOne('SELECT tag_id FROM product_tags WHERE tag_name = ?s', trim($Tag));
                    if($TagId)
                        $this->DB->Query('INSERT IGNORE INTO product_to_tags SET product_id = ?i, tag_id = ?i', $Id, $TagId);
                }
            }
        }
        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function RemoveItem($Id)
    {
        $Photos = $this->DB->GetAll('SELECT * FROM product_photos  WHERE content_id = ?i', $Id);

        $this->DB->Query('DELETE FROM products WHERE product_id = ?i', $Id);
        $this->DB->Query('DELETE FROM products_trans WHERE product_id = ?i', $Id);
        $this->DB->Query('DELETE FROM product_photos WHERE content_id = ?i', $Id);

        $this->DB->Query('DELETE FROM products_variants WHERE product_id = ?i', $Id);
        $this->DB->Query('DELETE FROM products_variant_photos WHERE variant_id IN(SELECT variant_id FROM products_variants WHERE product_id = ?i)', $Id);
        $this->DB->Query('DELETE FROM products_variant_attrs WHERE product_id = ?i', $Id);

        $this->DB->Query('DELETE FROM product_to_categories WHERE product_id = ?i', $Id);
        $this->DB->Query('DELETE FROM product_to_tags WHERE product_id = ?i', $Id);

        $ThumbPath = UPLOAD_PATH . 'product/';

        foreach ($Photos as $Photo) {
            @unlink($ThumbPath . $Photo['photo_name']);
            @unlink($ThumbPath . 'l_'.$Photo['photo_name']);
            @unlink($ThumbPath . 'm_'.$Photo['photo_name']);
            @unlink($ThumbPath . 's_'.$Photo['photo_name']);
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function SortImages()
    {
        $Order = Request::Post();
        foreach ($Order['stack'] as $k => $value)
        {
            $i = $k+1;
            $this->DB->Query('UPDATE product_photos SET ordering =?i WHERE photo_id = ?i', $i, $value['key']);
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function RemoveImage($Id)
    {
        $Photo = $this->DB->GetRow('SELECT * FROM product_photos WHERE photo_id = ?i', $Id);

        $this->DB->Query('DELETE FROM product_photos WHERE photo_id = ?i', $Id);
        $this->DB->Query('DELETE FROM products_variant_photos WHERE photo_id = ?i', $Id);
        // Update Ordering
        $Photos = $this->DB->GetAll('SELECT * FROM product_photos  WHERE content_id = ?i', $Photo['content_id']);
        $i = 1;
        foreach ($Photos as $p){
            $this->DB->Query('UPDATE product_photos SET ordering = ?i WHERE photo_id = ?i', $i, $p['photo_id']);
            $i++;
        }

        $ThumbPath = UPLOAD_PATH . 'product/';

        @unlink($ThumbPath . $Photo['photo_name']);
        @unlink($ThumbPath . 'l_'.$Photo['photo_name']);
        @unlink($ThumbPath . 's_'.$Photo['photo_name']);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }
}