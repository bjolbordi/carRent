<?php

class NewsModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetNews()
	{
        $Where = '';
        $Word = Request::Get('word');
        if($Word)
            $Where = 'AND t.title LIKE "%' . $Word . '%" ';
        if(is_numeric($Word))
            $Where = 'AND n.id = '.$Word.'';
        $Limit = Functions::PageLimits(CONTENT_PER_PAGE);

        $Data = $this->DB->GetAll('SELECT SQL_CALC_FOUND_ROWS 
									n.*,
									t.title,
									t.lang_id
									FROM news n
									LEFT JOIN news_trans t ON t.content = n.id
									WHERE t.lang_id = 1 ' . $Where . $Limit);
        $this->Params['ContentCount'] = $this->DB->GetOne('SELECT found_rows()');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function GetNewsData($Id)
	{
		$Array = [];
		$Data = $this->DB->GetAll('SELECT
									n.*,
									t.title,
									t.text,
									t.moretext,
									t.lang_id
									FROM news n
									LEFT JOIN news_trans t ON t.content = n.id
									WHERE n.id = ?i', (int)$Id);
		foreach($Data as $val){
			$Array[$val['lang_id']] = $val;
		}
		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

	public function GetItemImages($Id)
	{
		$Data = $this->DB->GetAll('SELECT
									p.*
									FROM news_photos p
									WHERE p.content_id = ?i
									ORDER BY p.content_photo_cover DESC', $Id);
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

    public function GetTags($Id = 0)
    {
        $Array = [];
        if($Id){
            $Data = $this->DB->GetAll('SELECT
									t.tag_name
									FROM news_to_tags pt
									LEFT JOIN news_tags t ON t.tag_id = pt.tag_id
									WHERE pt.news_id = ?i', $Id);
        }else{
            $Data = $this->DB->GetAll('SELECT
									t.tag_name
									FROM news_to_tags pt
									LEFT JOIN news_tags t ON t.tag_id = pt.tag_id');
        }

        foreach ($Data as $Val){
            $Array[] = $Val['tag_name'];
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

	public function Insert($Post)
	{
		$Params['show_title'] = (isset($Post['show_title']) ? 1 : 0);
		$Params['published'] = (isset($Post['published']) ? 1 : 0);
		$Params['featured'] = (isset($Post['featured']) ? 1 : 0);
		$Params['published_date'] = $Post['published_date'];
		$this->DB->Query('INSERT INTO news SET ?u ', $Params);
		$Id = $this->DB->insertId();

		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$Val['lang_id'] = $Lang;
				$Val['content'] = $Id;
				$this->DB->Query('INSERT INTO news_trans SET ?u', $Val);
			}
		}

        if(isset($Post['tags'])){
            foreach (explode(',', $Post['tags']) as $Tag) {
                if(trim($Tag)){
                    $this->DB->Query('INSERT IGNORE INTO news_tags SET tag_name = ?s', trim($Tag));
                    $TagId = $this->DB->getOne('SELECT tag_id FROM news_tags WHERE tag_name = ?s', trim($Tag));
                    $this->DB->Query('INSERT IGNORE INTO news_to_tags SET news_id = ?i, tag_id = ?i', $Id, $TagId);
                }
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
				$ImagePath = UPLOAD_PATH . 'news/' .$Microtime . '.'. $Ext;

                if(!is_dir(UPLOAD_PATH . 'news/'))
                    mkdir(UPLOAD_PATH . 'news/');

				if (move_uploaded_file($TmpName, $ImagePath))
				{
					$ThumbPath =  UPLOAD_PATH . 'news/';
					$Image::createThumb($ImagePath, $ThumbPath, 'l_', NEWS_WIDTH_L, NEWS_HEIGHT_L, true, 90, '');
                    $Image::createThumb($ImagePath, $ThumbPath, 'm_', NEWS_WIDTH_M, NEWS_HEIGHT_M, false, 90, '');
					$Image::createThumb($ImagePath, $ThumbPath, 's_', NEWS_WIDTH_S, NEWS_HEIGHT_S, true, 90, '');
				}
				$this->DB->Query('INSERT INTO news_photos SET content_id = ?i, content_photo_name = ?s', $Id, $Microtime.'.'.$Ext);
				$i++;
			}

			if(!$this->DB->GetOne('SELECT count(0) FROM news_photos  WHERE content_id = ?i AND content_photo_cover = 1', $Id))
				$this->DB->Query('UPDATE news_photos SET content_photo_cover = 1 WHERE content_id = ?i LIMIT 1',$Id);

		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Update($Id, $Post)
	{
		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$this->DB->Query('UPDATE news_trans SET ?u WHERE content = ?i AND lang_id = ?i', $Val, $Id, $Lang);
			}
		}

		$Params['show_title'] = (isset($Post['show_title']) ? 1 : 0);
		$Params['published'] = (isset($Post['published']) ? 1 : 0);
		$Params['featured'] = (isset($Post['featured']) ? 1 : 0);
		$Params['published_date'] = $Post['published_date'];
		$this->DB->Query('UPDATE news SET ?u WHERE id = ?i', $Params, $Id);

        $this->DB->Query('DELETE FROM news_to_tags WHERE news_id = ?i', $Id);
        if(isset($Post['tags'])){
            foreach (explode(',', $Post['tags']) as $Tag) {
                if(trim($Tag)){
                    $this->DB->Query('INSERT IGNORE INTO news_tags SET tag_name = ?s', trim($Tag));
                    $TagId = $this->DB->getOne('SELECT tag_id FROM news_tags WHERE tag_name = ?s', trim($Tag));
                    $this->DB->Query('INSERT IGNORE INTO news_to_tags SET news_id = ?i, tag_id = ?i', $Id, $TagId);
                }
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
				$ImagePath = UPLOAD_PATH . 'news/' .$Microtime . '.'. $Ext;

                if(!is_dir(UPLOAD_PATH . 'news/'))
                    mkdir(UPLOAD_PATH . 'news/');

				if (move_uploaded_file($TmpName, $ImagePath))
				{
					$ThumbPath = UPLOAD_PATH . 'news/';
					$Image::createThumb($ImagePath, $ThumbPath, 'l_', NEWS_WIDTH_L, NEWS_HEIGHT_L, true, 90, '');
					$Image::createThumb($ImagePath, $ThumbPath, 'm_', NEWS_WIDTH_M, NEWS_HEIGHT_M, false, 90, '');
					$Image::createThumb($ImagePath, $ThumbPath, 's_', NEWS_WIDTH_S, NEWS_HEIGHT_S, true, 90, '');
				}
				$this->DB->Query('INSERT INTO news_photos SET content_id = ?i, content_photo_name = ?s', $Id, $Microtime.'.'.$Ext);
				$i++;
			}

			if(!$this->DB->GetOne('SELECT count(0) FROM news_photos  WHERE content_id = ?i AND content_photo_cover = 1', $Id))
				$this->DB->Query('UPDATE news_photos SET content_photo_cover = 1 WHERE content_id = ?i LIMIT 1',$Id);

		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Remove($Id)
	{
		$this->DB->Query('DELETE FROM news WHERE id = ?i', $Id);
		$this->DB->Query('DELETE FROM news_trans WHERE content = ?i', $Id);
        $this->DB->Query('DELETE FROM news_to_tags WHERE news_id = ?i', $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function CoverImage($Id)
	{
		$Content = $this->DB->GetOne('SELECT content_id FROM news_photos WHERE content_photo_id = ?i', $Id);
		$this->DB->Query('UPDATE news_photos SET content_photo_cover = 0 WHERE content_id = ?i', $Content);
		$this->DB->Query('UPDATE news_photos SET content_photo_cover = 1 WHERE content_photo_id = ?i', $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function RemoveImage($Id)
	{
		$Photo = $this->DB->GetRow('SELECT * FROM news_photos WHERE content_photo_id = ?i', $Id);

		$this->DB->Query('DELETE FROM news_photos WHERE content_photo_id = ?i', $Id);
		if($Photo['content_photo_cover'])
			$this->DB->Query('UPDATE news_photos SET content_photo_cover = 1 WHERE content_id = ?i LIMIT 1', $Photo['content_id']);

		$ThumbPath = UPLOAD_PATH . 'news/';

		@unlink($ThumbPath.$Photo['content_photo_name']);
		@unlink($ThumbPath.'l_'.$Photo['content_photo_name']);
		@unlink($ThumbPath.'m_'.$Photo['content_photo_name']);
		@unlink($ThumbPath.'s_'.$Photo['content_photo_name']);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}