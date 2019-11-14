<?php
/**
* Main Controller
*/
class Main extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->SetStats();
		$this->View->render('main/index.tpl', $this->Model->Params);
	}

}