<?php

class CronModel extends Model
{
	private $PipeDrive;

    public function __construct()
	{		
		parent::__construct();
	}

    public function StartCron($Title)
    {
        $this->DB->Query('INSERT INTO cron_logs SET cron_name = ?s, cron_message = "Start"', $Title);
        return $this->DB->insertId();
    }

    public function EndCron($Id)
    {
        $this->DB->Query('UPDATE cron_logs SET cron_message = "Finish", end_date = NOW(), seconds = (end_date - start_date) WHERE id = ?i', $Id);
        return $this->DB->insertId();
    }

    public function PipeDriveOrders()
    {
        $Orders = $this->DB->GetAll('SELECT
									o.amount, 
									o.shiping_amount, 
									o.shiping_date, 
									o.order_id,
									o.insert_date,
									o.user_first_name,
									o.user_last_name,
									o.user_phone,
									o.user_email
									FROM orders o
									WHERE o.status_id = 0 LIMIT 5');
        $Options = ['api_key' => API_KEY, 'stage_id' => STAGE_ID];
        $this->PipeDrive = new PipeDrive($Options);
        foreach ($Orders as $Order){
            // Set UserId
            $UserIds = json_decode(USER_IDS, true);
            $UserId = $this->DB->GetOne('SELECT user_id FROM pipedrive_users LIMIT 1');
            if(!$UserId)
                $UserId = $UserIds[0];
            $Key = array_search($UserId, $UserIds);
            if($Key+1 == count($UserIds))
                $NextUserId = $UserIds[0];
            else
                $NextUserId = $UserIds[$Key+1];
            $this->DB->Query('UPDATE pipedrive_users SET user_id = ?i WHERE id = 1', $NextUserId);

            // Set PersonId
            $UserName = trim($Order['user_first_name'] . ' ' . $Order['user_last_name']);
            $Data['term'] = $Order['user_email'];
            $Data['search_by_email'] = 1;
            $Data['start'] = 0;
            $Data['limit'] = 1;
            $Result = $this->PipeDrive->FindPerson($Data);

            if($Result['success']){
                if($Result['data'][0]['id']){
                    $PersonId = $Result['data'][0]['id'];
                }else{
                    unset($Data);
                    $Data['owner_id'] = $UserId;
                    $Data['name'] = $UserName;
                    $Data['email'] = $Order['user_email'];
                    $Data['phone'] = $Order['user_phone'];
                    $Result = $this->PipeDrive->CreatePerson($Data);
                    if($Result['success'])
                        $PersonId = $Result['data']['id'];
                    else
                        $PersonId = 0;
                }
            }else{
                $PersonId = 0;
            }

            $Deal['user_id'] = $UserId;
            $Deal['person_id'] = $PersonId;
            $Deal['title'] = $Order['user_first_name'] . ' ' . $Order['user_last_name'] . '(' . $Order['user_phone'] . ')';
            //$Deal['value'] = $Order['amount'];
            $Deal['add_time'] = $Order['insert_date'];
            $Deal['currency'] = 'GEL';

            $Result = $this->PipeDrive->CreateDeal($Deal);

            if($Result['success']){
                $Note['deal_id'] = $Result['data']['id'];
                $Html = $this->GetProductsHtml($Order['order_id'], $Order['amount'], $Order['shiping_amount'], $Note['deal_id']);
                $Note['content'] = $Html;
                $this->PipeDrive->CreateNote($Note);
                $this->DB->Query('UPDATE orders SET status_id = 1 WHERE order_id = ?i', $Order['order_id']);
                $Text = str_replace('{OrderId}', $Order['order_id'], SMS_MESSAGE);
                $Text = str_replace('{Amount}', $Order['amount']+$Order['shiping_amount'], $Text);
                $Text = str_replace('{Date}', $Order['shiping_date'], $Text);
                SMS::Send($Order['user_phone'], $Text);
                echo $Note['deal_id'] . '</br>';
            }
        }
    }

    public function UpdateSales()
    {
        $this->DB->Query('UPDATE products SET sale = 0, sale_end_date = NULL WHERE sale_end_date > 0 AND sale_end_date <  now()');
        $this->DB->Query('UPDATE products_variants SET sale = 0, sale_end_date = NULL WHERE sale_end_date > 0 AND sale_end_date <  now()');
    }

    private function GetProductsHtml($OrderId, $OrderAmount, $ShipingAmount, $DealId)
    {
        $Data = $this->DB->GetAll('SELECT
									op.price,
									op.quantity,
									op.insert_date,
									op.product_id,
									op.variant_id,
									IF(v.variant_id, v.sku, p.sku) AS sku,
									IF(v.variant_id, v.code, p.code) AS code,
									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,
									t.title,
									t.desc,
									av.color,
									GROUP_CONCAT(at.title, ": ", avt.title) as attr
									FROM order_products op
									LEFT JOIN products p ON p.product_id = op.product_id
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.variant_id = op.variant_id
									LEFT JOIN products_variant_attrs va ON va.variant_id = v.variant_id
									LEFT JOIN attr_values av ON av.attr_value_id = va.attr_value_id
									LEFT JOIN attr_values_trans avt ON avt.attr_value_id = av.attr_value_id AND avt.lang_id = t.lang_id
									LEFT JOIN attrs ON av.attr_id = attrs.attr_id
                                    LEFT JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = t.lang_id
									WHERE op.order_id = ?i
									GROUP BY p.product_id, av.attr_value_id', 1, (int)$OrderId);

        $Html = '<h1><a href="' . URL . 'admin/ka/orders/detail/' . $OrderId . '" target="blank">შეკვეთის ბმული</a></h1>';
        $Html .= '<h1> ფასი ' . $OrderAmount . ' + მიტანის ' . $ShipingAmount . ' ლარი</h1>';
        $Html .= '<ul>';
        foreach ($Data as $Product){
            $Html .= '<li><a href="' . URL . 'ka/product/detail/' . $Product['product_id'] . '/' . $Product['variant_id'] . '" target="blank">'. $Product['title'] . ' - ' . $Product['attr'] . ' (' . $Product['quantity'] . ')</a></li>';
            // add product
            $DealProduct['id'] = $DealId;
            $DealProduct['product_id'] = $Product['pipedrive_id'];
            $DealProduct['quantity']   = $Product['quantity'];
            $DealProduct['item_price'] = $Product['price'];
            $this->PipeDrive->AddDealProduct($DealProduct);
        }
        $Html .= '<ul>';
        return $Html;
    }

    private function GetProducts($Table)
    {
        return $this->DB->GetAll('SELECT
                                    p.product_id,
                                    p.status_id,
                                    b.title as brand,
									IF(v.variant_id, v.sale, p.sale) AS sale,
									IF(v.variant_id, v.price, p.price) AS price,
									IF(v.variant_id, v.quantity, p.quantity) AS quantity,
									IF(v.variant_id, v.pipedrive_id, p.pipedrive_id) AS pipedrive_id,
									IF(v.variant_id, v.sku, p.sku) AS sku,
									IF(v.variant_id, v.code, p.code) AS code,
									t.title,
									pp.variant_id,
									GROUP_CONCAT(at.title, ": ", avt.title) as attr
									FROM ' . $Table . ' pp
									LEFT JOIN products p ON p.product_id = pp.product_id
									LEFT JOIN products_trans t ON t.product_id = p.product_id AND t.lang_id = ?i
									LEFT JOIN products_variants v ON v.variant_id = pp.variant_id
									LEFT JOIN products_variant_attrs va ON va.variant_id = v.variant_id
									LEFT JOIN attr_values av ON av.attr_value_id = va.attr_value_id
									LEFT JOIN attr_values_trans avt ON avt.attr_value_id = av.attr_value_id AND avt.lang_id = t.lang_id
									LEFT JOIN attrs ON av.attr_id = attrs.attr_id
                                    LEFT JOIN attr_trans at ON attrs.attr_id = at.attr_id AND at.lang_id = t.lang_id
                                    LEFT JOIN brands b ON b.brand_id = p.brand_id
									GROUP BY p.product_id, av.attr_value_id ORDER BY pp.insert_date ASC LIMIT 1', 1);


    }

    public function AddProducts()
    {
        $Options = ['api_key' => API_KEY];
        $this->PipeDrive = new PipeDrive($Options);

        $Products = $this->GetProducts('pipedrive_added_products');
        foreach ($Products as $Product)
        {
            $HasVariants = $this->DB->getOne('SELECT count(0) FROM products_variants WHERE product_id = ?i',
                $Product['product_id']);
            if($HasVariants && $Product['variant_id'] == 0){
                $this->DB->query('DELETE FROM pipedrive_added_products WHERE product_id = ?i AND variant_id = ?i',
                    $Product['product_id'], $Product['variant_id']);
                continue;
            }

            $Data['name'] = $Product['title'] . ($Product['attr'] ? ' (' . $Product['attr'] . ')' : '');
            $Data['code']   = $Product['code'];
            $Data['563b97513428d9273a8c81a2c107d2212d74ebbb'] = $Product['brand'];
            $Data['unit']   = $Product['quantity'];
            $Data['prices'] = ['prices' => ['currency' => 'GEL', 'price' => $Product['sale'] > 0 ? $Product['sale'] : $Product['price'], 'cost' => $Product['price'], ]];
            $Data['active_flag'] = $Product['status_id'] == 1 ? 1 : 0;
            $Result = $this->PipeDrive->CreateProduct($Data);
            if($Result['success']){
                // Update ID
                if($Product['variant_id']){
                    $this->DB->query('UPDATE products_variants SET pipedrive_id = ?i WHERE product_id = ?i AND variant_id = ?i',
                        $Result['data']['id'], $Product['product_id'], $Product['variant_id']);
                }
                else{
                    $this->DB->query('UPDATE products SET pipedrive_id = ?i WHERE product_id = ?i',
                        $Result['data']['id'], $Product['product_id']);
                }

                $this->DB->query('DELETE FROM pipedrive_added_products WHERE product_id = ?i AND variant_id = ?i',
                    $Product['product_id'], $Product['variant_id']);
            }
        }
    }

    public function UpdateProducts()
    {
        $Options = ['api_key' => API_KEY];
        $this->PipeDrive = new PipeDrive($Options);

        $Products = $this->GetProducts('pipedrive_edited_products');

        foreach ($Products as $Product)
        {

            $Data['id'] = $Product['pipedrive_id'];
            $Data['name'] = $Product['title'] . ($Product['attr'] ? ' (' . $Product['attr'] . ')' : '');
            $Data['code']   = $Product['code'];
            $Data['563b97513428d9273a8c81a2c107d2212d74ebbb'] = $Product['brand'];
            $Data['unit']   = $Product['quantity'];
            $Data['prices'] = [['currency' => 'GEL', 'price' => $Product['sale'] > 0 ? $Product['sale'] : $Product['price'], 'cost' => $Product['price']]];
            $Data['active_flag'] = $Product['status_id'] == 1 ? 1 : 0;
            $Result = $this->PipeDrive->UpdateProduct($Data);
            if($Result['success']){
                $this->DB->query('DELETE FROM pipedrive_edited_products WHERE product_id = ?i AND variant_id = ?i',
                    $Product['product_id'], $Product['variant_id']);
            }
        }
    }

    public function DeleteProducts()
    {
        $Options = ['api_key' => API_KEY];
        $this->PipeDrive = new PipeDrive($Options);

        $Products = $this->GetProducts('pipedrive_deleted_products');

        foreach ($Products as $Product)
        {
            $Data['id'] = $Product['pipedrive_id'];
            $Result = $this->PipeDrive->DeleteProduct($Data);
            if($Result['success']){
                $this->DB->query('DELETE FROM pipedrive_deleted_products WHERE product_id = ?i AND variant_id = ?i',
                    $Product['product_id'], $Product['variant_id']);
            }
        }

    }

    public function FixPipeDriveProducts()
    {
        $Products = $this->DB->GetAll('SELECT
                                    p.product_id,
                                    v.variant_id
									FROM products p
									LEFT JOIN products_variants v ON v.product_id = p.product_id AND v.default = 1
								    WHERE p.pipedrive_id > 0 AND v.variant_id > 0
									GROUP BY p.product_id LIMIT 10');

        foreach ($Products as $Product)
        {
            $this->DB->query('INSERT IGNORE INTO pipedrive_deleted_products SET product_id = ?i',
                $Product['product_id']);
        }
    }

    public function FixOldProducts()
    {
        $this->DB->query('DELETE FROM pipedrive_added_products WHERE now() > insert_date + INTERVAL 7 DAY');
        $this->DB->query('DELETE FROM pipedrive_edited_products WHERE now() > insert_date + INTERVAL 7 DAY');
        $this->DB->query('DELETE FROM pipedrive_deleted_products WHERE now() > insert_date + INTERVAL 7 DAY');
    }
}