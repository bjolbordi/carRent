<?php

class ContactModel extends Model
{
    function __construct()
    {
        parent::__construct();
    }

    public function GetContactInfo()
    {
        return $this->DB->getAll('SELECT * FROM contact_info WHERE contact_lang_id = ?i', Lang::GetLangID());
    }

    public function Send()
    {
        $Subject = SITE . ' - Contact';
        $Html = '<h1>' . $Subject . '<h3>' . Request::Post('name') . '</h3></h1><div style="color:#0066cc;font-size:16px;">' . Request::Post('message') . '</div>';
        $Responce = Email::Send(EMAIL, Request::Post('email'), $Subject, $Html);
        if ($Responce) {
            $this->SetResult(1);
        } else {
            $this->SetResult(0);
        }
    }
}