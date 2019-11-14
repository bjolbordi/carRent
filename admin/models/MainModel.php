<?php

/**
* Main Model
*/
class MainModel extends Model
{

	function __construct()
	{
		parent::__construct();

	}

	public function SetStats()
	{

		$this->Params['admins'] = $this->DB->GetOne(' SELECT count(0) FROM users WHERE role = 1 OR role = 2');
		$this->Params['users'] = $this->DB->GetOne(' SELECT count(0) FROM users WHERE role = 3');
		$this->Params['pages'] = $this->DB->GetOne(' SELECT count(0) FROM pages WHERE published = 1');
		$this->Params['slides'] = $this->DB->GetOne(' SELECT count(0) FROM slider');

	}
	
}