<?php

/**
* Main Model
*/
class TranslateModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetLangs($Word = '')
	{
		$Search = '';
		if(strlen($Word) >= 2){
			$Langs = json_decode(LANGS, true);
			$Search = 'WHERE lang_var LIKE "%'.$Word.'%" ';
			foreach($Langs as $Key => $Val){
				$Search .= 'OR lang_'.$Key.' LIKE "%'.$Word.'%" ';
			}
		}

		$Data = $this->DB->GetAll('SELECT * FROM langs '.$Search.' LIMIT 50');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function Update($Post)
	{
		if($this->DB->Query('UPDATE langs SET lang_'.$Post['lang'].' = ?s WHERE id = ?i', $Post['text'], $Post['id']))
			$this->SetResult(true, 'Success');
		else
			$this->SetResult(false, 'error');
		return $this->Result;
	}
}