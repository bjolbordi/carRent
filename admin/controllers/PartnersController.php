<?php

class Partners extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['partners'] = $this->Model->GetPartners()['Data'];
		$this->View->render('partners/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post()){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/partners/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->View->render('partners/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/partners/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['partner'] = $this->Model->GetPartnerData($Id)['Data'];
		if(!$this->Model->Params['partner'])
			$this->Model->Error();

		$this->View->render('partners/inc/edit.tpl', $this->Model->Params);
	}

	public function Remove($Id)
	{
		$Result = $this->Model->Remove($Id);
		echo json_encode($Result);
	}

	public function SaveSort()
	{
		$Result = $this->Model->SaveSort(Request::Post());
		echo json_encode($Result);
	}
}