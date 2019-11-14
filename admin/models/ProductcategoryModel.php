<?php

class ProductcategoryModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

    public function GetCategories($Id = 0)
    {
        $Data = $this->DB->GetAll('SELECT
									c.*,
									t.title,
									t.desc,
									t.lang_id
									FROM product_categories c
									LEFT JOIN product_categories_trans t ON t.category_id = c.category_id
									WHERE t.lang_id = 1 AND c.parent_id = ?i ORDER BY c.ordering ASC', $Id);
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetCategoryData($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									c.*,
									t.title,
									t.desc,
									t.lang_id
									FROM product_categories c
									LEFT JOIN product_categories_trans t ON t.category_id = c.category_id
									WHERE c.category_id = ?i', (int)$Id);
        foreach($Data as $val){
            $Array[$val['lang_id']] = $val;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

    public function GetAllCategory($Id = 0)
    {
        $Data = $this->DB->GetAll('SELECT
									c.*,
									t.title,
									t.desc,
									t.lang_id
									FROM product_categories c
									LEFT JOIN product_categories_trans t ON t.category_id = c.category_id
									WHERE t.lang_id = 1 AND c.category_id != ?i ORDER BY t.title', $Id);
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function InsertCategory($Post)
    {
        $Oredring = $this->DB->GetOne('SELECT count(0)+1 FROM product_categories  WHERE parent_id = ?i', $Post['parent_id']);

        $this->DB->Query('INSERT INTO product_categories SET ordering = ?i, parent_id = ?i, featured = ?i', $Oredring, $Post['parent_id'], isset($Post['featured']) ? 1 : 0 );
        $Id = $this->DB->insertId();

        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $Val['lang_id'] = $Lang;
                $Val['category_id'] = $Id;
                $this->DB->Query('INSERT INTO product_categories_trans SET ?u', $Val);
            }
        }

        if(Request::File('image')){
            $Image = new Image();
            $AllowedExts = ["jpeg", "jpg", "png", "JPG", "JPEG"];
            $Path = Request::File('image')['name'];
            $Ext = pathinfo($Path, PATHINFO_EXTENSION);
            if (!in_array($Ext, $AllowedExts))
            {
                $this->SetResult(true, 'Supported image formats  jpeg, jpg, png ');
                return $this->Result;
            }
            $Microtime = ceil(microtime(false) * 1000).time();
            $ImagePath = UPLOAD_PATH . 'category/' . $Microtime . '.' . $Ext;
            $TmpName = Request::File('image')['tmp_name'];

            if(!is_dir(UPLOAD_PATH . 'category/'))
                mkdir(UPLOAD_PATH . 'category/');

            if (move_uploaded_file($TmpName, $ImagePath))
            {
                $ThumbPath = UPLOAD_PATH . 'category/';
                $Image::createThumb($ImagePath, $ThumbPath, '', CATEGORY_WIDTH_L, CATEGORY_HEIGHT_L, true, 90, '');
            }
            $this->DB->Query('UPDATE product_categories SET image = ?s WHERE category_id = ?i', $Microtime . '.' . $Ext, $Id);
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function UpdateCategory($Id, $Post)
    {
        $this->DB->Query('UPDATE product_categories SET parent_id = ?i, featured = ?i WHERE category_id = ?i', $Post['parent_id'], isset($Post['featured']) ? 1 : 0, $Id);

        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $this->DB->Query('UPDATE product_categories_trans SET ?u WHERE category_id = ?i AND lang_id = ?i', $Val, $Id, $Lang);
            }
        }

        if(Request::File('image')){
            $Image = new Image();
            $AllowedExts = ["jpeg", "jpg", "png", "JPG", "JPEG"];
            $Path = Request::File('image')['name'];
            $Ext = pathinfo($Path, PATHINFO_EXTENSION);
            if (!in_array($Ext, $AllowedExts))
            {
                $this->SetResult(true, 'Supported image formats  jpeg, jpg, png ');
                return $this->Result;
            }
            $Microtime = ceil(microtime(false) * 1000).time();
            $ImagePath = UPLOAD_PATH . 'category/' . $Microtime . '.' . $Ext;
            $TmpName = Request::File('image')['tmp_name'];

            if(!is_dir(UPLOAD_PATH . 'category/'))
                mkdir(UPLOAD_PATH . 'category/');

            if (move_uploaded_file($TmpName, $ImagePath))
            {
                $ThumbPath = UPLOAD_PATH . 'category/';
                $Image::createThumb($ImagePath, $ThumbPath, '', CATEGORY_WIDTH_L, CATEGORY_HEIGHT_L, true, 90, '');

                // remove old image
                $OldName = $this->DB->GetOne('SELECT image FROM product_categories WHERE category_id = ?i', $Id);
                @unlink($ThumbPath.$OldName);
            }
            $this->DB->Query('UPDATE product_categories SET image = ?s WHERE category_id = ?i', $Microtime . '.' . $Ext, $Id);
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function RemoveCategory($Id)
    {
        $Count = $this->DB->GetOne('SELECT count(0) FROM product_categories  WHERE parent_id = ?i', $Id);
        if($Count){
            $this->SetResult(false, 'First remove sub categories');
            return $this->Result;
        }
        $this->DB->Query('DELETE FROM product_categories WHERE category_id = ?i', $Id);
        $this->DB->Query('DELETE FROM product_categories_trans WHERE category_id = ?i', $Id);
        $this->DB->Query('DELETE FROM product_categories WHERE category_id = ?i', $Id);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function SaveSort($Post)
    {
        $Order = explode(',', $Post['data']);
        foreach ($Order as $k => $id)
        {
            $i = $k+1;
            $this->DB->Query('UPDATE product_categories SET ordering =?i WHERE category_id = ?i', $i, $id);
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }
}