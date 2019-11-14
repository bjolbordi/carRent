<?php

class AttributeModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

	public function GetAttributes()
    {
        $Data = $this->DB->GetAll('SELECT
                                        a.*,
                                        t.title,
                                        t.lang_id,
                                        type.title as attr_type
                                        FROM attrs a
                                        LEFT JOIN attr_trans t ON t.attr_id = a.attr_id
                                        LEFT JOIN attr_types_trans type ON type.type_id = a.type_id AND type.lang_id = 1
                                        WHERE t.lang_id = 1 ORDER BY ordering ASC');
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetAttributeData($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									a.*,
									t.title,
									t.lang_id
									FROM attrs a
									LEFT JOIN attr_trans t ON t.attr_id = a.attr_id
									WHERE a.attr_id = ?i', (int)$Id);
        foreach($Data as $val){
            $Array[$val['lang_id']] = $val;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

    public function GetAttributeTypes()
    {
        $Data = $this->DB->GetAll('SELECT
                                        a.*,
                                        t.title,
                                        t.lang_id
                                        FROM attr_types a
                                        LEFT JOIN attr_types_trans t ON t.type_id = a.type_id
                                        WHERE t.lang_id = 1');
        $this->SetResult(true, '', $Data);
        return $this->Result;
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

    public function GetItems($Id)
    {
        $Data = $this->DB->GetAll('SELECT
									v.*,
									t.title,
									t.lang_id
									FROM attr_values v
									LEFT JOIN attr_values_trans t ON t.attr_value_id = v.attr_value_id
									WHERE v.attr_id = ?i AND t.lang_id = 1
									ORDER BY ordering ASC', (int)$Id);
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetItemData($Id)
    {
        $Array = [];
        $Data = $this->DB->GetAll('SELECT
									v.*,
									t.title,
									t.lang_id,
									a.type_id
									FROM attr_values v
									LEFT JOIN attr_values_trans t ON t.attr_value_id = v.attr_value_id
									LEFT JOIN attrs a ON a.attr_id = v.attr_id
									WHERE v.attr_value_id = ?i', (int)$Id);
        foreach($Data as $val){
            $Array[$val['lang_id']] = $val;
        }
        $this->SetResult(true, '', $Array);
        return $this->Result;
    }

    public function GetAttrType($Id)
    {
        $Data = $this->DB->GetOne('SELECT
									type_id
									FROM attrs
									WHERE attr_id = ?i', (int)$Id);

        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetColors()
    {
        $Data = $this->DB->GetAll('SELECT
                                        c.color_id,
                                        t.title
                                        FROM colors c
                                        LEFT JOIN colors_trans t ON t.color_id = c.color_id
                                        WHERE t.lang_id = 1 ORDER BY c.ordering ASC');

        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function InsertItem($Attribute, $Post)
    {
        $Oredring = $this->DB->GetOne('SELECT count(0)+1 FROM attr_values WHERE attr_id = ?i', $Attribute);

        $Item['attr_id'] = $Attribute;
        $Item['color'] = isset($Post['color']) ? strtolower($Post['color']) : '';
        $Item['color_id'] = isset($Post['color_id']) ? (int)$Post['color_id'] : 0;
        $Item['ordering'] = $Oredring;

        if($Item['color']){
            $Check = $this->DB->GetOne('SELECT count(0) FROM attr_values WHERE attr_id = ?i AND LOWER(color) = ?s ', $Item['attr_id'], $Item['color']);
            if($Check){
                $this->SetResult(false, 'Duplicated color');
                return $this->Result;
            }
        }

        $this->DB->Query('INSERT INTO attr_values SET ?u', $Item);
        $Id = $this->DB->insertId();

        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $Val['lang_id'] = $Lang;
                $Val['attr_value_id'] = $Id;
                $this->DB->Query('INSERT INTO attr_values_trans SET ?u', $Val);
            }
        }

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function UpdateItem($Attribute, $Id, $Post)
    {
        foreach ($Post as $Lang => $Val) {
            if(is_array($Val)){
                $this->DB->Query('UPDATE attr_values_trans SET ?u WHERE attr_value_id = ?i AND lang_id = ?i', $Val, $Id, $Lang);
            }
        }

        $Item['attr_id'] = $Attribute;
        $Item['color'] = isset($Post['color']) ? strtolower($Post['color']) : '';
        $Item['color_id'] = isset($Post['color_id']) ? (int)$Post['color_id'] : 0;

        if($Item['color']){
            $Check = $this->DB->GetOne('SELECT count(0) FROM attr_values WHERE attr_value_id != ?i AND attr_id = ?i AND LOWER(color) = ?s ',$Id, $Item['attr_id'], $Item['color']);
            if($Check){
                $this->SetResult(false, 'Duplicated color');
                return $this->Result;
            }
        }

        $this->DB->Query('UPDATE attr_values SET ?u WHERE attr_value_id = ?i', $Item, $Id);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function RemoveItem($Id)
    {
        $this->DB->Query('DELETE FROM attr_values WHERE attr_value_id = ?i', $Id);
        $this->DB->Query('DELETE FROM attr_values_trans WHERE attr_value_id = ?i', $Id);

        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function SaveSort($Post)
    {
        $Order = explode(',', $Post['data']);
        foreach ($Order as $k => $id)
        {
            $i = $k+1;
            $this->DB->Query('UPDATE attrs SET ordering =?i WHERE attr_id = ?i', $i, $id);
        }
        $this->SetResult(true, 'Success');
        return $this->Result;
    }

    public function SaveValuesSort($Post)
    {
        $Order = explode(',', $Post['data']);
        foreach ($Order as $k => $id)
        {
            $i = $k+1;
            $this->DB->Query('UPDATE attr_values SET ordering =?i WHERE attr_value_id = ?i', $i, $id);
        }
        $this->SetResult(true, 'Success');
        return $this->Result;
    }
}