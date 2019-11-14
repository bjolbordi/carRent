<?php

class Translate extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		if(Request::Req('ajax'))
			return;
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['langs'] = $this->Model->Getlangs()['Data'];
		$this->View->render('translate/index.tpl', $this->Model->Params);
	}

	public function GetLangs()
	{
		$this->Model->Params['langs'] = $this->Model->Getlangs(Request::Post('word'))['Data'];
		$Html = $this->View->render('translate/list.tpl', $this->Model->Params, true);
		echo json_encode(['Status' => true, 'Data' => $Html]);
	}

	public function Update()
	{
		echo json_encode($this->Model->Update(Request::Post()));
	}
}