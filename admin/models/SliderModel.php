<?php


class SliderModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetSliders()
	{
		$Data = $this->DB->GetAll('SELECT
									s.* ,
									t.*
									FROM slider s
									LEFT JOIN slider_trans t ON t.slider_id = s.slider_id
									WHERE t.slider_lang = 1
									ORDER BY slider_order ASC');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function GetSliderData($Id)
	{
		$Array = [];
		$Data = $this->DB->GetAll('SELECT
									s.*,
									t.*
									FROM slider s
									LEFT JOIN slider_trans t ON t.slider_id = s.slider_id
									WHERE s.slider_id = ?i', (int)$Id);
		foreach($Data as $val){
			$Array[$val['slider_lang']] = $val;
		}
		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

    public function GetCategories()
    {
        $Data = $this->DB->GetAll('SELECT
									c.* ,
									t.title
									FROM product_categories c
									LEFT JOIN product_categories_trans t ON t.category_id = c.category_id
									WHERE t.lang_id = 1
									ORDER BY c.ordering ASC');
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetBrands()
    {
        $Data = $this->DB->GetAll('SELECT
									*
									FROM brands
									ORDER BY ordering ASC');
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetSliderCategories($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
                                    *
									FROM slider_to_categories c
									WHERE slider_id = ?i', $Id);
        foreach ($Data as $value){
            $Array[$value['category_id']] = $value;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

	public function Insert($Post)
	{
		if(Request::File('slider_image')){
			$Image = new Image();
			$AllowedExts = ["jpeg", "jpg", "png", "JPG", "JPEG"];
			$Path = Request::File('slider_image')['name'];
			$Ext = pathinfo($Path, PATHINFO_EXTENSION);
			if (!in_array($Ext, $AllowedExts))
			{
				$this->SetResult(true, 'Supported image formats  jpeg, jpg, png ');
				return $this->Result;
			}
			$Microtime = ceil(microtime(false) * 1000).time();
			$ImagePath = UPLOAD_PATH . 'slider/' . $Microtime . '.' . $Ext;
			$TmpName = Request::File('slider_image')['tmp_name'];

            if(!is_dir(UPLOAD_PATH . 'slider/'))
                mkdir(UPLOAD_PATH . 'slider/');

			if (move_uploaded_file($TmpName, $ImagePath))
			{
				$ThumbPath = UPLOAD_PATH . 'slider/';
				$Image::createThumb($ImagePath, $ThumbPath, 'l_', SLIDER_WIDTH_L, SLIDER_HEIGHT_L, true, 90, '');
				$Image::createThumb($ImagePath, $ThumbPath, 's_', SLIDER_WIDTH_S, SLIDER_HEIGHT_S, true, 90, '');
			}

			$this->DB->Query('INSERT INTO slider SET slider_image = ?s, brand_id = ?i, home = ?i, target_blank = ?i',
                $Microtime . '.' . $Ext, $Post['brand_id'], isset($Post['home']) ? 1 : 0, isset($Post['target_blank']) ? 1 : 0);
			$Id = $this->DB->insertId();

            if(isset($Post['categories'])){
                foreach ($Post['categories'] as $CategoryId) {
                    $this->DB->Query('INSERT INTO slider_to_categories SET slider_id = ?i, category_id = ?i', $Id, $CategoryId);
                }
            }

			foreach ($Post as $Lang => $Val) {
				if(is_array($Val) && is_numeric($Lang)){
					$Val['slider_lang'] = $Lang;
					$Val['slider_id'] = $Id;
					$this->DB->Query('INSERT INTO slider_trans SET ?u', $Val);
				}
			}
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Update($Id, $Post)
	{
		foreach ($Post as $Lang => $Val) {
			if(is_array($Val) && is_numeric($Lang)){
				$this->DB->Query('UPDATE slider_trans SET ?u WHERE slider_id = ?i AND slider_lang = ?i', $Val, $Id, $Lang);
			}
		}

        $this->DB->Query('DELETE FROM slider_to_categories WHERE slider_id = ?i', $Id);

        if(isset($Post['categories'])){
            foreach ($Post['categories'] as $CategoryId) {
                $this->DB->Query('INSERT INTO slider_to_categories SET slider_id = ?i, category_id = ?i', $Id, $CategoryId);
            }
        }

        $this->DB->Query('UPDATE slider SET brand_id = ?s, home = ?i, target_blank = ?i WHERE slider_id = ?i',
            $Post['brand_id'], isset($Post['home']) ? 1 : 0, isset($Post['target_blank']) ? 1 : 0, $Id);

		if(Request::File('slider_image')){
			$Image = new Image();
			$AllowedExts = ["jpeg", "jpg", "png", "JPG", "JPEG"];
			$Path = Request::File('slider_image')['name'];
			$Ext = pathinfo($Path, PATHINFO_EXTENSION);
			if (!in_array($Ext, $AllowedExts))
			{
				$this->SetResult(true, 'Supported image formats  jpeg, jpg, png ');
				return $this->Result;
			}
			$Microtime = ceil(microtime(false) * 1000).time();
			$ImagePath = UPLOAD_PATH . 'slider/' . $Microtime . '.' . $Ext;
			$TmpName = Request::File('slider_image')['tmp_name'];

            if(!is_dir(UPLOAD_PATH . 'slider/'))
                mkdir(UPLOAD_PATH . 'slider/');

			if (move_uploaded_file($TmpName, $ImagePath))
			{
				$ThumbPath = UPLOAD_PATH . 'slider/';
				$Image::createThumb($ImagePath, $ThumbPath, 'l_', SLIDER_WIDTH_L, SLIDER_HEIGHT_L, true, 90, '');
				$Image::createThumb($ImagePath, $ThumbPath, 's_', SLIDER_WIDTH_S, SLIDER_HEIGHT_S, true, 90, '');

                // remove old image
                $OldName = $this->DB->GetOne('SELECT slider_image FROM slider  WHERE slider_id = ?i', $Id);
                @unlink($ThumbPath.$OldName);
                @unlink($ThumbPath.'l_'.$OldName);
                @unlink($ThumbPath.'s_'.$OldName);
			}


			$this->DB->Query('UPDATE slider SET slider_image = ?s WHERE slider_id = ?i', $Microtime . '.' . $Ext, $Id);
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Remove($Id)
	{
		$ImageName = $this->DB->GetOne('SELECT slider_image FROM slider WHERE slider_id = ?i', $Id);

		$this->DB->Query('DELETE FROM slider WHERE slider_id = ?i', $Id);
		$this->DB->Query('DELETE FROM slider_trans WHERE slider_id = ?i', $Id);
        $this->DB->Query('DELETE FROM slider_to_categories WHERE slider_id = ?i', $Id);

		$Path = UPLOAD_PATH. 'slider/';
		@unlink($Path.$ImageName);
		@unlink($Path.'l_'.$ImageName);
		@unlink($Path.'s_'.$ImageName);

		$this->SetResult(true, 'Success');

		return $this->Result;
	}

	public function SaveSort($Post)
	{
		$Order = explode(',', $Post['data']);
		foreach ($Order as $k => $id)
		{
			$i = $k+1;
			$this->DB->Query('UPDATE slider SET slider_order =?i WHERE slider_id = ?i', $i, $id);
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}