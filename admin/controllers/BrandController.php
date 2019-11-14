<?php

class Brand extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['brands'] = $this->Model->GetBrands()['Data'];
		$this->View->render('brand/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post()){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/brand/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->View->render('brand/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/brand/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['brand'] = $this->Model->GetBrandData($Id)['Data'];
		if(!$this->Model->Params['brand'])
			$this->Model->Error();

		$this->View->render('brand/inc/edit.tpl', $this->Model->Params);
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