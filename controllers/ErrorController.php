<?php

class Error extends Controller
{
	private $Menu;

	function __construct($Model, $ModelPath, $Menu)
	{
		$this->Menu = $Menu;
		parent::__construct($Model, $ModelPath);
		$this->Model->SetMetaData($this->Menu);
        $this->Model->SetCurrentMenu($this->Menu);
	}
	
	public function Index()
	{
		$this->View->render('error/error.tpl', $this->Model->Params);
	}
}