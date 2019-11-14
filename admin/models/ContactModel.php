<?php

class ContactModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetContactData()
	{
		$Array = [];
		$Data = $this->DB->GetAll('SELECT * FROM contact_info');
		foreach($Data as $val){
			$Array[$val['contact_lang_id']] = $val;
		}
		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

	public function Update($Post)
	{
		foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				if($Post['latitude'] != '' || $Post['longitude'] != '' ||$Post['zoom'] != '')
					$Val['contact_location'] = $Post['latitude'].','.$Post['longitude'].','.$Post['zoom'];

				$this->DB->Query('UPDATE contact_info SET ?u WHERE contact_lang_id = ?i', $Val, $Lang);
			}
		}
		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}