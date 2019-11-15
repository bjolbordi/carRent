<?php

class Product extends Controller
{
	private $Menu;

	function __construct($Model, $ModelPath, $Menu)
	{
		$this->Menu = $Menu;
		parent::__construct($Model, $ModelPath);
        if(Request::Req('ajax'))
            return false;
		$this->Model->SetMetaData($this->Menu);
        $this->Model->SetCurrentMenu($this->Menu);
	}

	public function Index()
	{
        $Ajax = false;
        if(!Request::Req('ajax'))
            $this->Model->Params['Slides'] = $this->Model->GetSlider();
        else{
            $Ajax = true;
            Request::UnSetGet('ajax');
        }

        $this->Model->Params['Page'] = (int)Request::Get('page') ? (int)Request::Get('page') : 1;
        $this->Model->Params['PerPage'] = 12;
        $this->Model->Params['Products'] = $this->Model->GetProducts($this->Model->Params['Page'], $this->Model->Params['PerPage']);
        $this->Model->Params['Count'] = $this->Model->Count;

        $this->Model->Params['FilterCategories'] = $this->Model->GetFilterCategories();
        $this->Model->Params['FilterBrands'] = $this->Model->GetFilterBrands();
        $this->Model->Params['FilterStock'] = $this->Model->GetFilterStock();
        $this->Model->Params['FilterAttrs'] = $this->Model->GetFilterAttrs();
        $this->Model->Params['FilterPrice'] = $this->Model->GetFilterPrice();
        $this->Model->Params['FilterColors'] = $this->Model->GetFilterColors();

        // set url
        Request::UnSetGet('url');
        Request::UnSetGet('page');
        $this->Model->Params['Url'] = urldecode(http_build_query(Request::Get()));

        if($Ajax){
            echo $this->View->render('product/ajax.tpl', $this->Model->Params, true);
        }else{
            if(is_numeric(Request::Get('category'))){
                $this->Model->SetMetaData(
                    [
                        'title' => $this->Model->Params['categories']['items'][Request::Get('category')]['title'],
                        'desc' => $this->Model->Params['categories']['items'][Request::Get('category')]['desc']
                    ]);
            }
            $this->View->render('product/index.tpl', $this->Model->Params);
        }

	}

	public function Detail($Id = 0, $Ajax = false)
	{
		if(empty((int)$Id))
			$this->Model->Error();
		$this->Model->Params['Product'] = $this->Model->GetProduct((int)$Id);
        if(!$this->Model->Params['Product'])
            $this->Model->Error();


		
        if($Ajax){
            $this->Model->Params['FavoritesArray'] =  json_decode(Cookie::Get('favorites'), true);
            return $this->View->Render('product/ajax_detail.tpl', $this->Model->Params, true);
        }
        else{
            
            $this->View->Render('product/detail.tpl', $this->Model->Params);
        }
	}

    public function GetVariantId()
    {
        $Result = $this->Model->GetVariantId(Request::Post());
        if(is_numeric($Result['Data'])){
            $VariantId = $Result['Data'];
            $Result['Data'] = [];
            $Result['Data']['variant_id'] = $VariantId;
            $Result['Data']['html'] = $this->Detail(Request::Post('product_id'), $VariantId, true);
        }
        echo json_encode($Result);
    }

    public function Test(){
        $Data = $this->Model->DB->GetAll('SELECT
                                  av.*,
                                  pva.variant_id,
                                  pva2.attr_value_id as other_attr_value_id
                                  FROM products_variant_attrs pva
                                  LEFT JOIN attr_values av ON av.attr_value_id = pva.attr_value_id
                                  LEFT JOIN products_variant_attrs pva2 ON pva2.variant_id = pva.variant_id AND pva2.attr_value_id != av.attr_value_id
                                  WHERE av.attr_id = 1 AND pva.variant_id IS NOT NULL AND  pva2.attr_value_id IS  NULL
                                 ');
        Functions::Pre($Data);
        foreach($Data as $Val){
            $this->Model->DB->Query('DELETE FROM products_variants WHERE variant_id = ?i', $Val['variant_id']);
            $this->Model->DB->Query('DELETE FROM products_variant_photos WHERE variant_id = ?i', $Val['variant_id']);
            $this->Model->DB->Query('DELETE FROM products_variant_attrs WHERE variant_id = ?i', $Val['variant_id']);
        }
        $this->Model->DB->Query('DELETE FROM attr_values WHERE attr_id = 1');
    }

}