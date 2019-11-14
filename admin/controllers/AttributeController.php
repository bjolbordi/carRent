<?php

class Attribute extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

	public function Index()
    {
        $this->Model->Params['attributes'] = $this->Model->GetAttributes()['Data'];
        $this->View->render('attribute/attributes.tpl', $this->Model->Params);
    }

	public function AddAttribute()
	{
		if(Request::Post()){
			$Result = $this->Model->InsertAttribute(Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/attribute/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
        $this->Model->Params['types'] = $this->Model->GetAttributeTypes()['Data'];
        $this->View->render('attribute/inc/add_attribute.tpl', $this->Model->Params);
	}

	public function EditAttribute($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->UpdateAttribute($Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/attribute/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['attribute'] = $this->Model->GetAttributeData($Id)['Data'];
        $this->Model->Params['types'] = $this->Model->GetAttributeTypes()['Data'];

        //Functions::Pre($this->Model->Params['attribute']);
		if(!$this->Model->Params['attribute'])
			$this->Model->Error();

		$this->View->render('attribute/inc/edit_attribute.tpl', $this->Model->Params);
	}

	public function RemoveAttribute($Id)
	{
		$Result = $this->Model->RemoveAttribute($Id);
		echo json_encode($Result);
	}

	public function Items($Id, $SaveSort = '')
	{
		if($SaveSort == 'savesort'){
            $Result = $this->Model->SaveValuesSort(Request::Post());
            echo json_encode($Result);
            exit;
        }

        $this->Model->Params['items'] = $this->Model->GetItems($Id)['Data'];
		$this->View->render('attribute/items.tpl', $this->Model->Params);
	}

	public function AddItem($Attribute)
	{
		if(Request::Post()){
			$Result = $this->Model->InsertItem($Attribute, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/attribute/items/'.$Attribute.'/');
			else
				$this->Model->Params['message'] = $Result['Message'];
		}
        $this->Model->Params['colors'] = $this->Model->GetColors()['Data'];
        $this->Model->Params['type_id'] = $this->Model->GetAttrType($Attribute)['Data'];
		$this->View->render('attribute/inc/add_item.tpl', $this->Model->Params);
	}

	public function EditItem($Attribute, $Id)
	{
		if(Request::Post()){
			$Result = $this->Model->UpdateItem($Attribute, $Id, Request::Post());
			if($Result['Status'])
				header('location: '.URL.$this->Model->Lang .'/attribute/items/'.$Attribute.'/');
			else
				$this->Model->Params['message'] = $Result['Message'];

		}
		$this->Model->Params['item'] = $this->Model->GetItemData($Id)['Data'];
        $this->Model->Params['colors'] = $this->Model->GetColors()['Data'];
		//Functions::Pre($this->Model->Params['item']);
		if(!$this->Model->Params['item'])
			$this->Model->Error();

		$this->View->render('attribute/inc/edit_item.tpl', $this->Model->Params);
	}

	public function RemoveItem($Id)
	{
		$Result = $this->Model->RemoveItem($Id);
		echo json_encode($Result);
	}

	public function SaveSort()
	{
		$Result = $this->Model->SaveSort(Request::Post());
		echo json_encode($Result);
	}
}