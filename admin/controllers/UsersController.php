<?php

class Users extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Model->Params['users'] = $this->Model->GetUsers()['Data'];
		$this->Model->Params['Page'] = Request::Get('page') ? (int)Request::Get('page') : 1;
		// set url
		Request::UnSetGet('url');
		Request::UnSetGet('page');
		$this->Model->Params['Url'] = http_build_query(Request::Get());
		$this->View->render('users/index.tpl', $this->Model->Params);
	}

	public function Add()
	{
		if(Request::Post('username')){
			$Result = $this->Model->Insert(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/users/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->View->render('users/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post('username')){
			$Result = $this->Model->Update($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/users/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['user'] = $this->Model->GetUserData($Id)['Data'];
		if(!$this->Model->Params['user'])
			$this->Model->Error();

		$this->View->render('users/inc/edit.tpl', $this->Model->Params);
	}

	public function Remove($Id)
	{
		$Result = $this->Model->Remove($Id);
		echo json_encode($Result);
	}
}