<?php

class OrdersModel extends Model
{

	function __construct()
	{
		parent::__construct();
	}

    public function GetItems()
    {
        $Where = '';
        $Word = Request::Get('word');
        if($Word)
            $Where = 'AND o.user_first_name LIKE "%' . $Word . '%"  OR o.user_last_name LIKE "%' . $Word . '%" OR o.user_phone LIKE "%' . $Word . '%" OR o.user_email LIKE "%' . $Word . '%"';
        if(is_numeric($Word))
            $Where = 'AND o.order_id = '.$Word.'';
        $Limit = Functions::PageLimits(CONTENT_PER_PAGE);

        $Data = $this->DB->GetAll('SELECT SQL_CALC_FOUND_ROWS
									o.*
									FROM orders o
									WHERE 1 ' . $Where . '
									ORDER BY order_id ASC ' . $Limit);
        $this->Params['ContentCount'] = $this->DB->GetOne('SELECT found_rows()');
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

    public function GetItemData($Id)
    {
        $Data = $this->DB->GetAll('SELECT
									op.price,
									op.quantity,
									op.insert_date,
									op.product_id,
									op.variant_id,
									p.sku,
									p.price as product_price,
									t.title,
									t.desc,
									t.lang_id,
									v.sku as variant_sku,
									av.color,
									GROUP_CONCAT(avt.title) as attr
									FROM order_products op
									LEFT JOIN products p ON p.product_id = op.product_id
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.variant_id = op.variant_id
									LEFT JOIN products_variant_attrs va ON va.variant_id = v.variant_id
									LEFT JOIN attr_values av ON av.attr_value_id = va.attr_value_id
									LEFT JOIN attr_values_trans avt ON avt.attr_value_id = av.attr_value_id AND avt.lang_id = ?i
									WHERE op.order_id = ?i
									GROUP BY v.variant_id',
            Lang::GetLangID(), Lang::GetLangID(), (int)$Id);
        $this->SetResult(true, '', $Data);
        return $this->Result;
    }

}