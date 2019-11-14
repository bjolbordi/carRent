<?php

/**
* single Model
*/
class SingleModel extends Model
{
	
	function __construct()
	{
		parent::__construct();

	}

	public function GetPage($PageId)
	{
		return $this->DB->GetRow('
								SELECT p.*, t.* 
								FROM pages p 
								LEFT JOIN pages_trans t ON t.content = p.id 
								WHERE p.id = ?i',
							$PageId);
	}
}