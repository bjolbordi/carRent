<?php

/**
* Main Model
*/
class PagesModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetPages()
	{
		$Data = $this->DB->GetAll('SELECT
									p.*,
									t.title,
									t.lang_id
									FROM pages p
									LEFT JOIN pages_trans t ON t.content = p.id
									WHERE t.lang_id = 1');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function GetPageData($Id)
	{
		$Array = [];
		$Data = $this->DB->GetAll('SELECT
									p.*,
									t.title,
									t.text,
									t.lang_id
									FROM pages p
									LEFT JOIN pages_trans t ON t.content = p.id
									WHERE p.id = ?i', (int)$Id);
		foreach($Data as $val){
			$Array[$val['lang_id']] = $val;
		}
		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

	public function Insert($Post)
	{
		$Params['show_title'] = (isset($Post['show_title']) ? 1 : 0);
		$Params['published'] = (isset($Post['published']) ? 1 : 0);
		$Params['published_date'] = $Post['published_date'];
		$this->DB->Query('INSERT INTO pages SET ?u ', $Params);
		$Id = $this->DB->insertId();

		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$Val['lang_id'] = $Lang;
				$Val['content'] = $Id;
				$this->DB->Query('INSERT INTO pages_trans SET ?u', $Val);
			}
		}

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Update($Id, $Post)
	{
		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$this->DB->Query('UPDATE pages_trans SET ?u WHERE content = ?i AND lang_id = ?i', $Val, $Id, $Lang);
			}
		}

		$Params['show_title'] = (isset($Post['show_title']) ? 1 : 0);
		$Params['published'] = (isset($Post['published']) ? 1 : 0);
		$Params['published_date'] = $Post['published_date'];
		$this->DB->Query('UPDATE pages SET ?u WHERE id = ?i', $Params, $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}

	public function Remove($Id)
	{
		$this->DB->Query('DELETE FROM pages WHERE id = ?i', $Id);
		$this->DB->Query('DELETE FROM pages_trans WHERE content = ?i', $Id);

		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}