<?php

class ColorsModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

    public function InsertAttribute($Post)
    {
        $Oredring = $this->DB->GetOne('SELECT count(0)+1 FROM attrs');

        $this->DB->Query('INSERT INTO attrs SET ordering = ?i, type_id = ?i', $Oredring, $Post['type_id']);
        $Id = $this->DB->insertId();

        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $Val['lang_id'] = $Lang;
                $Val['attr_id'] = $Id;
                $this->DB->Query('INSERT INTO attr_trans SET ?u', $Val);
            }
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function UpdateAttribute($Id, $Post)
    {
        $this->DB->Query('UPDATE attrs SET type_id = ?i WHERE attr_id = ?i', $Post['type_id'], $Id);
        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $this->DB->Query('UPDATE attr_trans SET ?u WHERE attr_id = ?i AND lang_id = ?i', $Val, $Id, $Lang);
            }
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function RemoveAttribut($Id)
    {
        $Count = $this->DB->GetOne('SELECT count(0) FROM attr_values  WHERE attr_id = ?i', $Id);
        if($Count){
            $this->SetResult(false, 'First remove all attribute values');
            return $this->Result;
        }
        $this->DB->Query('DELETE FROM attrs WHERE attr_id = ?i', $Id);
        $this->DB->Query('DELETE FROM attr_trans WHERE attr_id = ?i', $Id);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function GetItems()
    {
        $Data = $this->DB->GetAll('SELECT
									c.*,
									t.title,
									t.lang_id
									FROM colors c
									LEFT JOIN colors_trans t ON t.color_id = c.color_id
									WHERE t.lang_id = 1
									ORDER BY ordering ASC');
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetItemData($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									c.*,
									t.title,
									t.lang_id
									FROM colors c
									LEFT JOIN colors_trans t ON t.color_id = c.color_id
									WHERE c.color_id = ?i', (int)$Id);
        foreach($Data as $val){
            $Array[$val['lang_id']] = $val;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

    public function InsertItem($Post)
    {
        $Oredring = $this->DB->GetOne('SELECT count(0)+1 FROM attr_values');

        $Item['color'] = isset($Post['color']) ? strtolower($Post['color']) : '';
        $Item['ordering'] = $Oredring;

        $this->DB->Query('INSERT INTO colors SET ?u', $Item);
        $Id = $this->DB->insertId();

        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $Val['lang_id'] = $Lang;
                $Val['color_id'] = $Id;
                $this->DB->Query('INSERT INTO colors_trans SET ?u', $Val);
            }
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function UpdateItem($Id, $Post)
    {
        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $this->DB->Query('UPDATE colors_trans SET ?u WHERE color_id = ?i AND lang_id = ?i', $Val, $Id, $Lang);
            }
        }

        $Item['color'] = isset($Post['color']) ? strtolower($Post['color']) : '';

        $this->DB->Query('UPDATE colors SET ?u WHERE color_id = ?i', $Item, $Id);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function RemoveItem($Id)
    {
        $this->DB->Query('DELETE FROM colors WHERE color_id = ?i', $Id);
        $this->DB->Query('DELETE FROM colors_trans WHERE color_id = ?i', $Id);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function SaveSort($Post)
    {
        $Order = explode(',', $Post['data']);
        foreach ($Order as $k => $id)
        {
            $i = $k+1;
            $this->DB->Query('UPDATE colors SET ordering =?i WHERE color_id = ?i', $i, $id);
        }
        $this->SetResult(true, 'Success');
        return $this->Result;
    }
}