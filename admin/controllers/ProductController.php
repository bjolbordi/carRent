<?php

class Product extends Controller
{
	function __construct($Model, $ModelPath, $Menu)
	{
		parent::__construct($Model, $ModelPath);
		$this->Model->Params['menuItem'] = $Menu;
	}

    public function Index()
    {
      
        $this->Model->Params['items'] = $this->Model->GetItems()['Data'];
        

        $this->Model->Params['Page'] = Request::Get('page') ? (int)Request::Get('page') : 1;
        // set url
        Request::UnSetGet('url');
        Request::UnSetGet('page');
        $this->Model->Params['Url'] = http_build_query(Request::Get());
        $this->View->render('product/index.tpl', $this->Model->Params);
    }

	public function Add()
	{
        
        if(Request::Post()){
            $Result = $this->Model->Insert(Request::Post());
            echo $Result['Status'];
            if($Result['Status'])
                header('location: '.URL.$this->Model->Lang .'/product/');
            else
                $this->Model->Params['message'] = $Result['Message'];

        }
        $this->View->render('product/inc/add.tpl', $this->Model->Params);
	}

	public function Edit($Id)
	{
		if(Request::Post()){
			$Result = $this->Model->UpdateItem($Id, Request::Post());
			if(!$Result['Status'])
                $this->Model->Params['message'] = $Result['Message'];
		}
		/*$this->Model->Params['item'] = $this->Model->GetItemData($Id)['Data'];
		$this->Model->Params['images'] = $this->Model->GetItemImages($Id)['Data'];
        $this->Model->Params['categories'] = $this->Model->GetCategories()['Data'];
        $this->Model->Params['brands'] = $this->Model->GetBrands()['Data'];
        $this->Model->Params['productCategories'] = $this->Model->GetProductCategories($Id)['Data'];
        $this->Model->Params['attributes'] = $this->Model->GetAttributes()['Data'];
        $this->Model->Params['variants'] = $this->Model->GetVariants($Id)['Data'];
        $this->Model->Params['product_id'] = $Id;
        $this->Model->Params['tags'] = $this->Model->GetTags($Id)['Data'];
        $this->Model->Params['allTags'] = $this->Model->GetTags()['Data'];*/
		//Functions::Pre($this->Model->Params['tags']);
		/*if(!$this->Model->Params['item'])
			$this->Model->Error();*/

		$this->View->render('product/inc/edit.tpl', $this->Model->Params);
	}

    public function GetVariants($Id)
    {
        $this->Model->Params['variants'] = $this->Model->GetVariants($Id)['Data'];
        echo $this->View->render('product/inc/variants.tpl', $this->Model->Params, true);
    }

    public function Generate($Id)
    {
        //Functions::Pre(Request::Post('attr'));
        $Result = $this->Model->Generate($Id);
        echo json_encode($Result);
    }

    public function EditVariant($Id)
    {
        $Result = $this->Model->EditVariant($Id, Request::Post());
        echo json_encode($Result);
    }

    public function EditVariantImages($Id, $ProductId = false)
    {
        if(!$ProductId){
            $Result = $this->Model->EditVariantImages($Id, Request::Post());
            echo json_encode($Result);
        }
        else{
            $this->Model->Params['images'] = $this->Model->GetItemImages($ProductId)['Data'];
            $this->Model->Params['variantImages'] = $this->Model->GetVariantImages($Id)['Data'];
            $this->Model->Params['variant_id'] = $Id;
            $this->Model->Params['variant'] = $this->Model->GetVariant($Id)['Data'];
            echo $this->View->render('product/inc/variant_popup.tpl', $this->Model->Params, true);
        }
    }

    public function RemoveVariant($Id)
    {
        $Result = $this->Model->RemoveVariant($Id);
        echo json_encode($Result);
    }


    public function UploadImage($ProductId)
    {
        $Result = $this->Model->UploadImage($ProductId);
        echo json_encode($Result);
    }

	public function Remove($Id)
	{
		$Result = $this->Model->RemoveItem($Id);
		echo json_encode($Result);
	}

	public function RemoveImage()
	{
		$Result = $this->Model->RemoveImage(Request::Post('key'));
		echo json_encode($Result);
	}

	public function SortImages()
	{
		$Result = $this->Model->SortImages(Request::Post('id'));
		echo json_encode($Result);
	}
}