<?php

class Contact extends Controller
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
		$this->Model->Params['contact'] = $this->Model->GetContactData()['Data'];

		$Loc = explode(',', $this->Model->Params['contact'][1]['contact_location']);
		if(count($Loc) == 3){
			$this->Model->Params['latitude'] = $Loc[0];
			$this->Model->Params['longitude'] = $Loc[1];
			$this->Model->Params['zoom'] = $Loc[2];
		}
		else{
			$this->Model->Params['latitude'] = '41.72542561465178';
			$this->Model->Params['longitude'] = '44.77777099609375';
			$this->Model->Params['zoom'] = 12;
		}
		$this->View->render('contact/index.tpl', $this->Model->Params);
	}
}