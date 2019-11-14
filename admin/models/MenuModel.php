<?php

class MenuModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetMenuArray()
	{
		$Data = $this->DB->GetAll('SELECT
									m.* ,
									t.title
									FROM menu m
									LEFT JOIN menu_trans t ON t.menu_id = m.id
									WHERE t.language = 1 AND type = 1
									ORDER BY ordering ASC');
		$Array =  [
			'items' => [],
			'parents' => []
		];
		foreach ($Data as $Item) {
			$Array['items'][$Item['id']] = $Item;
			$Array['parents'][$Item['parent']][] = $Item['id'];
		}

		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

	public function GetMenuData($Id)
	{
		$Array = [];
		$Data = $this->DB->GetAll('SELECT
									m.*,
									t.title,
									t.metatitle,
									t.metakey,
									t.metadesc,
									t.language
									FROM menu m
									LEFT JOIN menu_trans t ON t.menu_id = m.id
									WHERE m.id = ?i', (int)$Id);
		foreach($Data as $val){
			$Array[$val['language']] = $val;
		}
		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

	public function GetPortfolioArray()
	{
		return $this->DB->GetAll('SELECT
									c.* ,
									t.title
									FROM portfolio_categories c
									LEFT JOIN portfolio_categories_trans t ON t.category_id = c.id
									WHERE t.lang_id = 1
									ORDER BY t.title');
	}

	public function GetPagesArray()
	{
		return $this->DB->GetAll('SELECT
									p.* ,
									t.title
									FROM pages p
									LEFT JOIN pages_trans t ON t.content = p.id
									WHERE t.lang_id = 1
									ORDER BY t.title');
	}

	public function GetAlbumsArray()
	{
		return $this->DB->GetAll('SELECT
									p.* ,
									t.title
									FROM photoalbum p
									LEFT JOIN photoalbum_trans t ON t.album_id = p.id
									WHERE t.lang_id = 1
									ORDER BY t.title');
	}

	public function GetVideoAlbumsArray()
	{
		return $this->DB->GetAll('SELECT
									v.* ,
									t.title
									FROM videoalbum v
									LEFT JOIN videoalbum_trans t ON t.album_id = v.id
									WHERE t.lang_id = 1
									ORDER BY t.title');
	}

	public function GetProducCategoriesArray()
	{
		return $this->DB->GetAll('SELECT
									c.* ,
									t.title
									FROM product_categories c
									LEFT JOIN product_categories_trans t ON t.category_id = c.id
									WHERE t.lang_id = 1
									ORDER BY t.title');
	}


	public function Insert($Post)
	{
		if(Request::File('image')['name']){
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
			$ImagePath = '../upload/menu/' . $Microtime . '.' . $Ext;
			$TmpName = Request::File('image')['tmp_name'];
			if (move_uploaded_file($TmpName, $ImagePath))
			{
				$ThumbPath = '../upload/menu/';
				$Image->createThumb($ImagePath, $ThumbPath, '', MENU_COVER_WIDTH_L, MENU_COVER_HEIGHT_L, true, 90, '');
				$Item['image'] = $Microtime . '.' . $Ext;
			}
		}
		$Item['view'] = $Post['view'];
		$Item['content'] = $Post['content'];
		$Item['parent'] = $Post['parent'];
		$Item['alias'] = $Post['alias'];
		$Item['home'] = (isset($Post['home']) ? 1 : 0);
		$Item['published'] = (isset($Post['published']) ? 1 : 0);
		$this->DB->Query('INSERT INTO menu SET ?u ', $Item);
		$Id = $this->DB->insertId();

		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$Val['language'] = $Lang;
				$Val['menu_id'] = $Id;
				$this->DB->Query('INSERT INTO menu_trans SET ?u', $Val);
			}
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Update($Id, $Post)
	{
		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$this->DB->Query('UPDATE menu_trans SET ?u WHERE menu_id = ?i AND language = ?i', $Val, $Id, $Lang);
			}
		}
		if(isset($Post['remove'])){
			$OldName = $this->DB->GetOne('SELECT image FROM menu WHERE id = ?i', $Id);
			@unlink($ThumbPath.$OldName);
			$Item['image'] = '';
		}
		if(Request::File('image')['name']){
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
			$ImagePath = '../upload/menu/' . $Microtime . '.' . $Ext;
			$TmpName = Request::File('image')['tmp_name'];
			if (move_uploaded_file($TmpName, $ImagePath))
			{
				$ThumbPath = '../upload/menu/';
				$Image->createThumb($ImagePath, $ThumbPath, '', MENU_COVER_WIDTH_L, MENU_COVER_HEIGHT_L, true, 90, '');
				$Item['image'] = $Microtime . '.' . $Ext;
			}

			// remove old image
			$OldName = $this->DB->GetOne('SELECT image FROM menu WHERE id = ?i', $Id);
			@unlink($ThumbPath.$OldName);
		}
		$Item['view'] = $Post['view'];
		$Item['content'] = $Post['content'];
		$Item['parent'] = $Post['parent'];
		$Item['alias'] = $Post['alias'];
		$Item['home'] = (isset($Post['home']) ? 1 : 0);
		$Item['published'] = (isset($Post['published']) ? 1 : 0);
		$this->DB->Query('UPDATE menu SET ?u WHERE id = ?i', $Item , $Id);
		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Remove($Id)
	{
		$ImageName = $this->DB->GetOne('SELECT image FROM menu WHERE id = ?i', $Id);

		$this->DB->Query('DELETE FROM menu WHERE id = ?i', $Id);
		$this->DB->Query('DELETE FROM menu_trans WHERE menu_id = ?i', $Id);

		$Path = '../upload/menu/';
		@unlink($Path.$ImageName);

		$this->SetResult(true, 'Success');

		return $this->Result;
	}

	public function SaveSort($Post)
	{
		foreach ($Post['data'] as $k => $val)
		{
			if(!is_array($val))
				continue;
			foreach($val as $key => $id){
				$this->DB->Query('UPDATE menu SET ordering = ?i, parent = ?i WHERE id = ?i', $key+1, $k, $id);
			}
		}
		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}