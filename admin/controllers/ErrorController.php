<?php

class Error extends Controller
{

	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->View->render('error/index.tpl', $this->Model->Params);
	}

}