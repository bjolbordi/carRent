<?php

/**
* Main Controller
*/
class Main extends Controller
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
		
		$this->Model->Params['Slides'] = $this->Model->GetSlider();
		$this->Model->Params['News'] = $this->Model->GetLastNews(5);

		//Functions::Pre($this->Model->Params['LastProducts']);
		$this->View->render('main/index.tpl', $this->Model->Params);
	}

}