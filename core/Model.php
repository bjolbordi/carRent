<?php

class Model 
{
	public $DB;
	public $MC;
	public $Params;
	public $Result = ['Status' => false, 'Message' => '', 'Data' => ''];
	public $MenuArray = [];

	function __construct()
	{
        $this->DB = new DataBase();
        
        if(Request::Req('ajax'))
            return;
		$this->Params['menu'] = $this->GetMenu();
        $this->Params['contact'] = $this->GetContactData();
		$this->Params['meta'] = ['title' => Lang::Get('meta_title'), 'key' => Lang::Get('meta_key'), 'desc' => Lang::Get('meta_desc')];
        $this->Lang = Lang::GetLang();
        
		$this->LangId = Lang::GetLangID();
	}

	public function SetResult($Status, $Message = '', $Data = '')
	{
		$this->Result = ['Status' => $Status, 'Message' => $Message, 'Data' => $Data];
	}

	public function SetMetaData($Array)
	{
        if(isset($Array['view']) && $Array['metatitle'])
			$this->Params['meta'] = ['title' => $Array['metatitle'], 'key' => $Array['metakey'], 'desc' =>$Array['metadesc']];
		if(!isset($Array['view'])){
            foreach ($Array as $Key => $Val)
            {
                $this->Params['meta'][$Key] = trim(strip_tags($Val));
            }
        }

	}

    public function SetCurrentMenu($Menu)
    {
        $this->Params['CurrentMenu'] = $Menu;
    }

	public function GetMenu()
	{
		$Menu = $this->DB->GetAll('SELECT
                                  m.*,
                                  t.title
                                  FROM menu m
                                  LEFT JOIN menu_trans t ON t.menu_id = m.id
                                  WHERE t.language = ?i AND type = 1 AND published = 1
                                  ORDER BY ordering ASC', Lang::GetLangID());

		$Array = [
			'items' => [],
			'parents' => []
		];
		foreach ($Menu as $Item) {
			$Array['items'][$Item['id']] = $Item;
			$Array['parents'][$Item['parent']][] = $Item['id'];
		}
		return $Array;
	}

    public function GetCategoriesMenu()
    {
        $Categories = $this->DB->GetAll('SELECT
                                  c.*,
                                  t.title,
                                  t.desc
                                  FROM product_categories c
                                  LEFT JOIN product_categories_trans t ON t.category_id = c.category_id
                                  WHERE t.lang_id = ?i
                                  ORDER BY c.ordering ASC', Lang::GetLangID());

        $Array =  [
            'items' => [],
            'parents' => []
        ];
        foreach ($Categories as $Item) {
            $Array['items'][$Item['category_id']] = $Item;
            $Array['parents'][$Item['parent_id']][] = $Item['category_id'];
        }
        return $Array;
    }

    public function GetBrands()
    {
        return	$this->DB->GetAll('SELECT
                                  *
                                  FROM brands
                                  ORDER BY title ASC');
    }

	public function GetContactData()
	{
		return $this->DB->GetRow('SELECT * FROM contact_info WHERE contact_lang_id = ?i', lang::GetLangID());
	}

    public function GetCountersData()
    {
        return $this->DB->GetOne('SELECT code FROM counters WHERE id = 1');
    }

    public function GetMessageData()
    {
        return $this->DB->GetRow('SELECT m.*, t.text 
                                FROM site_message m
                                LEFT JOIN site_message_trans t ON t.message_id = m.id AND t.lang_id = ?i
                                WHERE m.id = 1', Lang::GetLangID());
    }

	public function Error(){
		header('location: '.URL.$this->Lang .'/error/');
		exit;
	}
}
