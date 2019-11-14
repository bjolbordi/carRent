<?php

class UsersModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetUsers()
	{
		$Where = '';
		$Word = Request::Get('word');
		if($Word)
			$Where = 'AND username LIKE "%' . $Word . '%" OR email LIKE "%' . $Word. '%"';
		if(is_numeric($Word))
			$Where = 'AND id = '.$Word.'';
		$Limit = Functions::PageLimits(CONTENT_PER_PAGE);

		$Data = $this->DB->GetAll('SELECT * FROM users WHERE 1 ' . $Where . $Limit);
		$this->Params['ContentCount'] = $this->DB->GetOne('SELECT count(0) FROM users WHERE 1 ' . $Where);
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function GetUserData($Id)
	{
		$Data = $this->DB->GetRow('SELECT * FROM users WHERE id = ?i', (int)$Id);
		$this->SetResult(true, '', $Data);
		return $this->Result;
	}

	public function Insert($Post)
	{

		$UserData = $this->DB->GetRow('SELECT * FROM users WHERE username = ?s', $Post['username']);

		if(!$UserData) {
			$Post['password'] = md5($Post['password']);
			$Post['status'] = 1;
			unset($Post['password2']);
			if($this->DB->Query('INSERT INTO users SET ?u', $Post))
				$this->SetResult(true, 'Success');
			else
				$this->SetResult(false, 'error');
		}else{
			$this->SetResult(false, 'User with this username all ready exists');
		}

		return $this->Result;
	}

	public function Update($Id, $Post)
	{
		$UserData = $this->DB->GetRow('SELECT * FROM users WHERE username = ?s', $Post['username']);

        if(Session::Get('user')['role'] != 1 && $Post['role'] == 1){
            $this->SetResult(false, 'Cannot edit Super Admin user');
            return $this->Result;
        }
		if($UserData) {
			if(strlen($Post['password']) >= 6){
				$Post['password'] = md5($Post['password']);
			}else{
				unset($Post['password']);
			}
			unset($Post['password2']);
			if($this->DB->Query('UPDATE users SET ?u WHERE id = ?i', $Post, $Id))
				$this->SetResult(true, 'Success');
			else
				$this->SetResult(false, 'error');
		}else{
			$this->SetResult(false, 'User with this username not found');
		}

		return $this->Result;
	}

	public function Remove($Id)
	{
		$UserData = $this->DB->GetRow('SELECT * FROM users WHERE id = ?i', $Id);
		if($UserData['role'] == 1){
			$this->SetResult(false, 'Cannot delete Super Admin user');
			return $this->Result;
		}

		if($UserData['id'] == Session::Get('user')['id']){
			$this->SetResult(false, 'Cannot delete itself user');
			return $this->Result;
		}

		if($this->DB->Query('DELETE FROM users WHERE id = ?i', $Id))
			$this->SetResult(true, 'Success');
		else
			$this->SetResult(false, 'Error');
		return $this->Result;
	}
}