<?php

class PartnersModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetPartners()
	{
		$Data = $this->DB->GetAll('SELECT
									p.*
									FROM partners p
									ORDER BY ordering ASC');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function GetPartnerData($Id)
	{
		$Data = $this->DB->GetRow('SELECT
									p.*
									FROM partners p
									WHERE p.id = ?i', (int)$Id);
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function Insert($Post)
	{
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
			$ImagePath = UPLOAD_PATH . 'partners/' . $Microtime . '.' . $Ext;
			$TmpName = Request::File('image')['tmp_name'];

            if(!is_dir(UPLOAD_PATH . 'partners/'))
                mkdir(UPLOAD_PATH . 'partners/');

			if (move_uploaded_file($TmpName, $ImagePath))
			{
				$ThumbPath = UPLOAD_PATH . 'slider/';
				$Image::createThumb($ImagePath, $ThumbPath, '', PARTNER_WIDTH_L, PARTNER_HEIGHT_L, true, 90, '');
			}

			$this->DB->Query('INSERT INTO partners SET image = ?s, url = ?s ', $Microtime . '.' . $Ext, $Post['url']);
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Update($Id, $Post)
	{
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
			$ImagePath = UPLOAD_PATH . 'partners/' . $Microtime . '.' . $Ext;
			$TmpName = Request::File('image')['tmp_name'];

            if(!is_dir(UPLOAD_PATH . 'partners/'))
                mkdir(UPLOAD_PATH . 'partners/');

			if (move_uploaded_file($TmpName, $ImagePath))
			{
				$ThumbPath = UPLOAD_PATH . 'partners/';
                $Image::createThumb($ImagePath, $ThumbPath, '', PARTNER_WIDTH_L, PARTNER_HEIGHT_L, true, 90, '');

                // remove old image
                $OldName = $this->DB->GetOne('SELECT image FROM partners WHERE id = ?i', $Id);
                @unlink($ThumbPath.$OldName);
			}
			$this->DB->Query('UPDATE partners SET image = ?s WHERE id = ?i', $Microtime . '.' . $Ext, $Id);
		}

        $this->DB->Query('UPDATE partners SET url = ?s WHERE id = ?i', $Post['url'], $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Remove($Id)
	{
		$ImageName = $this->DB->GetOne('SELECT image FROM partners WHERE id = ?i', $Id);
		$this->DB->Query('DELETE FROM partners WHERE id = ?i', $Id);
		$Path = UPLOAD_PATH. 'partners/';
		@unlink($Path.$ImageName);
		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function SaveSort($Post)
	{
		$Order = explode(',', $Post['data']);
		foreach ($Order as $k => $id)
		{
			$i = $k+1;
			$this->DB->Query('UPDATE partners SET ordering = ?i WHERE id = ?i', $i, $id);
		}
		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}