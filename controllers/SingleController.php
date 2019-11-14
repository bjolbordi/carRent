<?php

/**
* Main Controller
*/
class Single extends Controller
{
	private $Menu;

	function __construct($Model, $ModelPath, $Menu)
	{
		$this->Menu = $Menu;
		parent::__construct($Model, $ModelPath);
		$this->Model->SetMetaData($this->Menu);
        $this->Model->SetCurrentMenu($this->Menu);

		if(Request::Req('Ajax'))
			return;
	}

	public function Index()
	{
		if(!$this->Menu['content'])
			$this->Error();
		$this->Model->Params['data'] = $this->Model->GetPage($this->Menu['content']);
        //Functions::Pre($this->Model->Params['data']);
		$this->View->render('single/index.tpl', $this->Model->Params);
	}
	

}