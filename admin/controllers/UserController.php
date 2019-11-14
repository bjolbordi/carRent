<?php
/**
* Main Controller
*/
class User extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
	{
		$this->Login();
	}

	public function Reset()
	{
		if(Request::Post('email'))
			$this->Model->SendResetMail(Request::Post('email'));
		if(Request::Post('code') && Request::Post('password'))
			$this->Model->ChangePassword(Request::Post('code'), Request::Post('password'));
		$this->View->render('user/reset.tpl', $this->Model->Params);
	}

	public function Login()
	{
		if(Request::Post('username') &&  Request::Post('password')){
			$UserData = $this->Model->Login(Request::Post('username'), Request::Post('password'));
			if($UserData)
				$this->Model->Params['message'] = $UserData;
			else
				header('location: '.URL.Lang::GetLang().'/');
		}
		$this->View->render('user/login.tpl', $this->Model->Params);
	}

	public function Logout()
	{
		Session::Destroy('user');
		header('location: '.URL.Lang::GetLang().'/user/');
	}
}