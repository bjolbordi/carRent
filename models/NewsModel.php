<?php

class NewsModel extends Model
{
    public $Count = 0;

	function __construct()
	{
		parent::__construct();
	}

	public function GetNews($Page, $PerPage)
	{
        $Start = $PerPage * ($Page - 1);
        $Limit = ' LIMIT ' . $Start . ', ' . $PerPage . '';
        $Data = $this->DB->GetAll('SELECT SQL_CALC_FOUND_ROWS n.*, t.title, t.text, photo.content_photo_name as image
								  FROM news n
								  LEFT JOIN news_trans t ON t.content = n.id
								  LEFT JOIN news_photos photo ON photo.content_id = n.id AND photo.content_photo_cover = 1
								  WHERE t.lang_id = ?i
								  ORDER BY n.published_date DESC '.$Limit.' ',
                        Lang::GetLangID());
        $this->Count = $this->DB->GetOne('SELECT FOUND_ROWS()');
        return $Data;
	}

	public function GetPost($Id)
	{
        $this->UpdateViews($Id);
        return $this->DB->GetRow('SELECT n.*, t.title, t.text, t.moretext
								  FROM news n
								  LEFT JOIN news_trans t ON t.content = n.id
								  WHERE n.id = ?i AND t.lang_id = ?i',
			$Id, Lang::GetLangID());
	}

	public function GetImages($Id)
	{
		return $this->DB->GetAll('SELECT p.*
								  FROM news_photos p
								  WHERE p.content_id = ?i
								  ORDER BY content_photo_cover DESC',
			$Id);
	}

	public function getRandomNews($Limit = 8)
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
                                  ORDER BY rand()
                                  LIMIT ?i", Lang::GetLangID(), $Limit);

	}

    public function getSimilarNews($Id, $Limit = 8)
    {
        /*$Tags = $this->DB->GetAll('SELECT tag_id FROM news_to_tags WHERE news_id = ?i', $Id);
        $Where = '';
        $i = 0;
        foreach ($Tags as $Key => $Val){
            if($i)
                $Where .= ' AND SUM(tg.tag_id = '.$Val["tag_id"].') > 0 ';
            else
                $Where = ' HAVING SUM(tg.tag_id = '.$Val["tag_id"].') > 0 ';
            $i++;
        }*/

        //Functions::Pre($Where);
        return  $this->DB->GetAll('SELECT
                                  news.*,
                                  t.title,
                                  t.text,
                                  t.moretext,
                                  i.content_photo_name as image
                                  FROM
                                  news
                                  LEFT JOIN news_trans as t ON t.content = news.id AND t.lang_id = ?i
                                  LEFT JOIN news_photos as i ON i.content_id = news.id AND i.content_photo_cover = 1
                                  INNER JOIN news_to_tags as tg ON tg.news_id = news.id
                                  WHERE news.published = 1 AND news.id != ?i AND tg.tag_id IN(SELECT tag_id FROM news_to_tags WHERE news_id = ?i)
                                  GROUP BY news.id 
                                  ORDER BY rand()
                                  LIMIT ?i', Lang::GetLangID(), $Id, $Id, $Limit);

    }

    public function UpdateViews($Id)
    {
        $this->DB->Query('UPDATE news SET views=views+1 WHERE id = ?i', $Id);
    }
}