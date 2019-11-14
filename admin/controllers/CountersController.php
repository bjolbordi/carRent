<?php

class Counters extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		if(Request::Post()){
			$Result = $this->Model->Update(Request::Post());
			if($Result['Status'])
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['data'] = $this->Model->GetCountersData()['Data'];
		$this->View->render('counters/index.tpl', $this->Model->Params);
	}
}