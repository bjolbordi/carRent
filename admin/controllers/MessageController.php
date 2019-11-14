<?php

class Message extends Controller
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
		$this->Model->Params['data'] = $this->Model->GetMessageData()['Data'];

		$this->View->render('message/index.tpl', $this->Model->Params);
	}
}