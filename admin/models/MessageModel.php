<?php

class MessageModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetMessageData()
	{
		$Array = [];
		$Data = $this->DB->GetAll('SELECT m.*, t.text, t.lang_id  FROM site_message m 
                                   LEFT JOIN site_message_trans t ON t.message_id = m.id');
		foreach($Data as $val){
			$Array[$val['lang_id']] = $val;
		}
		$this->SetResult(true, '', $Array);
		return $this->Result;
	}

	public function Update($Post)
	{
        if(!isset($Post['offline']))
                $Post['offline'] = 0;
        if(!isset($Post['status_id']))
            $Post['status_id'] = 0;
	    $this->DB->Query('UPDATE site_message SET status_id = ?i, offline = ?i, ip_address = ?s',
            $Post['status_id'], $Post['offline'], trim($Post['ip_address']));

        foreach ($Post as $Lang => $Val) {
			if(is_array($Val)){
				$this->DB->Query('UPDATE site_message_trans SET ?u WHERE lang_id = ?i', $Val, $Lang);
			}
		}
		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}