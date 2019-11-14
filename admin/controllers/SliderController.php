<?php

class Slider extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['sliders'] = $this->Model->GetSliders()['Data'];
		$this->View->render('slider/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post()){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/slider/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
        $this->Model->Params['categories'] = $this->Model->GetCategories()['Data'];
        $this->Model->Params['brands'] = $this->Model->GetBrands()['Data'];
        $this->View->render('slider/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/slider/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['slider'] = $this->Model->GetSliderData($Id)['Data'];
		$this->Model->Params['categories'] = $this->Model->GetCategories()['Data'];
        $this->Model->Params['brands'] = $this->Model->GetBrands()['Data'];
		$this->Model->Params['sliderCategories'] = $this->Model->GetSliderCategories($Id)['Data'];
        //Functions::Pre($this->Model->Params['sliderCategories']);
		if(!$this->Model->Params['slider'])
			$this->Model->Error();

		$this->View->render('slider/inc/edit.tpl', $this->Model->Params);
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