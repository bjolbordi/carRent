<?php
/**
* Main Controller
*/
class Pages extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['pages'] = $this->Model->GetPages()['Data'];
		$this->View->render('pages/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post()){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/pages/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->View->render('pages/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/pages/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['pages'] = $this->Model->GetPageData($Id)['Data'];
		//Functions::Pre($this->Model->Params['pages']);
		if(!$this->Model->Params['pages'])
			$this->Model->Error();

		$this->View->render('pages/inc/edit.tpl', $this->Model->Params);
	}

	public function Remove($Id)
	{
		$Result = $this->Model->Remove($Id);
		echo json_encode($Result);
	}
}