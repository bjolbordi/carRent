<?php

/**
* Main Model
*/
class UserModel extends Model
{

	function __construct()
	{
		parent::__construct();

	}

	public function Login($UserName, $Password)
	{
		if($UserName == '' || $Password == '')
			return 'შეავსეთ ყველა ველი';
		$UserData = $this->DB->GetRow('SELECT * FROM users WHERE role IN (1,2) AND username = ?s AND password = ?s', $UserName, $Password);
		if(!$UserData)
			return 'მომხმარებელი ან პაროლი არასწორია';
		else
			Session::Set('user', $UserData);
		return '';
	}

	public function SendResetMail($Email)
	{
		if(!Functions::IsEmail($Email)){
			$this->Params['message'] = 'შიყვანეთ ელ.ფოსტა';
			return;
		}
		$UserId = $this->DB->GetOne('SELECT id FROM users WHERE role IN(1,2) AND email = ?s', $Email);

		if(!$UserId){
			$this->Params['message'] = 'ელ.ფოსტა ვერ მოიძებნა';
			return;
		}

		$this->DB->Query('UPDATE password_reset SET status = 1 WHERE user_id= ?i', $UserId);

		$Code = md5($UserId . time() . 'reset');
		$Url = URL . Lang::GetLang() . '/user/reset/?code=' . $Code;

		$Send = Email::Send($Email, EMAIL, 'პაროლის აღდგენა', 'პაროლის აღსადგენად გთხოვთ გადახვიდეთ შემდეგ ბმულზე <a href="' . $Url . '" target="_blank">აღდგენა</a>');
		if($Send){
			$this->DB->Query('INSERT INTO password_reset SET user_id = ?i, code = ?s ', $UserId, $Code);
			$this->Params['message'] = 'მითითებულ ელ.ფოსტაზე წერილი წარმატებით გაიგზავნა';
		}
		else
			$this->Params['message'] = 'დაფიქსირდა შეცდომა';
	}

	public function ChangePassword($Code, $Password)
	{
		if(strlen($Password) < 6){
			$this->Params['message'] = 'შეიყვანეთ რთული პაროლი';
			return;
		}
		$UserId = $this->DB->GetOne('SELECT user_id FROM password_reset WHERE code = ?s AND status = 0', $Code);
		if($UserId) {
			$Post['password'] = md5($Password);
			$this->DB->Query('UPDATE password_reset SET status = 1 WHERE user_id= ?i', $UserId);
			if($this->DB->Query('UPDATE users SET ?u WHERE id = ?i', $Post, $UserId))
				$this->Params['message'] = 'პაროლი წარმატებით შეიცვალა';
		}else{
			$this->Params['message'] = 'პაროლის აღდგენის კოდი არასწორია';
		}
	}
}