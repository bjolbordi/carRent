<?php

class Model 
{
	public $DB;
	public $MC;
	public $Params = [];
	public $Lang = ADMIN_DEFAULT_LANG;
	public $LangId = 1;
	public $Result = ['Status' => false, 'Message' => '', 'Data' => ''];

	public $PhoneCodes = [559, 599, 595, 591, 598, 596, 551, 790, 577, 593, 558, 555, 597, 579, 571, 574, 557, 592, 514, 568, 570];

	function __construct()
	{
		$this->DB = new DataBase();
		$this->Params['menu'] = $this->GetMenu();
		$this->Lang = Lang::GetLang();
		$this->LangId = Lang::GetLangID();
	}

	public function SetResult($Status, $Message = '', $Data = '')
	{
		$this->Result = ['Status' => $Status, 'Message' => $Message, 'Data' => $Data];
	}

	public function GetMenu()
	{
		$Menu = $this->DB->GetAll('SELECT
                                  m.*,
                                  t.title
                                  FROM admin_menu m
                                  LEFT JOIN admin_menu_trans t ON t.menu_id = m.id
                                  WHERE t.language = ?i AND type = 1 AND published = 1
                                  ORDER BY home DESC, ordering ASC', Lang::GetLangID());

		$Array =  array(
			'items' => array(),
			'parents' => array()
		);
		foreach ($Menu as $Item) {
			$Array['items'][$Item['id']] = $Item;
			$Array['parents'][$Item['parent']][] = $Item['id'];
		}
		return $Array;
	}

	public function Error(){
		header('location: '.URL.$this->Lang .'/error/');
		exit;
	}

}