<?php

class PipeDrive
{
    private $Options = [
        'api_key' => '619c64ccb3eb4e645837dbbe867412962aa428f8',
        'stage_id' => 6
    ];

    public function __construct($Options = [])
    {
        $this->SetOptions($Options);
    }

    private function SetOptions($Options)
    {
        if (is_array($Options))
        {
            foreach ($Options as $Key => $Value)
            {
                $this->Options[$Key] = $Value;
            }
        }
    }

    public function CreateProduct($Data)
    {
        $Url = "https://api.pipedrive.com/v1/products?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data, 'JSON');
    }

    public function UpdateProduct($Data)
    {
        $Url = "https://api.pipedrive.com/v1/products/" . $Data['id'] . "?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data, 'PUT');
    }

    public function DeleteProduct($Data)
    {
        $Url = "https://api.pipedrive.com/v1/products/" . $Data['id'] . "?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data, 'DELETE');
    }

    public function CreateDeal($Data)
    {
        $Data['stage_id'] = $this->Options['stage_id'];
        $Url = "https://api.pipedrive.com/v1/deals?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data);
    }

    public function AddDealProduct($Data)
    {
        $Url = "https://api.pipedrive.com/v1/deals/" . $Data['id'] . "/products?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data);
    }

    public function CreateNote($Data)
    {
        $Url = "https://api.pipedrive.com/v1/notes?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data);
    }

    public function CreatePerson($Data)
    {
        $Url = "https://api.pipedrive.com/v1/persons?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data);
    }

    public function FindPerson($Data)
    {
        $Url = "https://api.pipedrive.com/v1/persons/find?api_token=" . $this->Options['api_key'];
        return $this->Curl($Url, $Data, 'GET');
    }

    public function Curl($Url, $Data, $Type = 'POST')
    {
        $Params = '';
        if($Type == 'GET')
            $Params = urldecode(http_build_query($Data));

        $ch = curl_init();
        if($Type == 'JSON'){
            $Type = 'POST';
            $Data = json_encode($Data);
            curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json','Content-Length: ' . strlen($Data)]);
        }
        if($Type == 'PUT'){
            $Data = json_encode($Data);
            curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json','Content-Length: ' . strlen($Data)]);
        }
        curl_setopt($ch, CURLOPT_URL, $Url . '&' . $Params);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST , $Type);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $Data);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
        $Output = curl_exec($ch);
        curl_close($ch);
        Functions::Pre(json_decode($Output, true), false);
        return json_decode($Output, true);
    }

}