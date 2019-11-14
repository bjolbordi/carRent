<?php

class CountersModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetCountersData()
	{

		$Data = $this->DB->GetRow('SELECT *
                                    FROM counters 
                                    WHERE id = 1');
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function Update($Post)
	{
	    $this->DB->Query('UPDATE counters SET code = ?s WHERE id = 1', $Post['code']);
		$this->SetResult(true, 'Success');
		return $this->Result;
	}
}