<?php

class Functions
{
    public static function IsEmail($Email)
    {
        if (preg_match("/[-a-zA-Z0-9_.+]+@[a-zA-Z0-9-]+.[a-zA-Z]+/", $Email) > 0)
            return true;
        return false;
    }

    public static function PopulateGet($Req, $Par)
    {
        $Gets = $Res = [];

        if ($_SERVER['QUERY_STRING'] != '') {
            $Quer = explode('&', rtrim($_SERVER['QUERY_STRING'], '&'));

            for ($i = 1; $i < count($Quer); $i++) {
                $Gets[substr($Quer[$i], 0, strpos($Quer[$i], '='))] = substr($Quer[$i], strpos($Quer[$i], '=') + 1);
            }
        }

        if (isset($Req, $Par) && $Req != '')
            $Gets[$Req] = $Par;

        foreach ($Gets as $Key => $Val) {
            if (Functions::NotSpace($Key)) {
                $Res[] = $Key . '=' . $Val;
            }
        }

        return str_replace('url=', URL, $Quer[0]) . '?' . implode('&', $Res);
    }

    public static function NotSpace($Var)
    {
        return strlen(str_replace(' ', '', trim($Var))) > 0;
    }

    public static function ObjectToArray($Object)
    {
        if (is_object($Object))
            $Object = get_object_vars($Object);
        return $Object;
    }

    public static function EmailToStars($Email)
    {
        //myemail@email.com -> my*****@ma***.com
        $Index = strpos($Email, '@');

        for ($i = 2; $i < $Index; $i++) {
            $Email[$i] = '*';
        }

        for ($i = $Index + 3; $i < strrpos($Email, '.'); $i++) {
            $Email[$i] = '*';
        }

        return $Email;
    }

    public static function GeneratePassword($Length = 9, $Strength = 0)
    {
        $Vowels = 'aeuy';
        $Consonants = 'bdghjmnpqrstvz';

        if ($Strength & 1) {
            $Consonants .= 'BDGHJLMNPQRSTVWXZ';
        }

        if ($Strength & 2) {
            $Vowels .= 'AEUY';
        }

        if ($Strength & 4) {
            $Consonants .= '23456789';
        }

        if ($Strength & 8) {
            $Consonants .= '@#$%';
        }

        $Password = '';
        $Alt = time() % 2;

        for ($i = 0; $i < $Length; $i++) {
            if ($Alt == 1) {
                $Password .= $Consonants[(rand() % strlen($Consonants))];
                $Alt = 0;
            } else {
                $Password .= $Vowels[(rand() % strlen($Vowels))];
                $Alt = 1;
            }
        }

        return $Password;
    }

    public static function GetPage($RowsNum, $PageName = 'Page')
    {
        $Resp = [];
        $Resp[$PageName] = Request::Req($PageName) > 1 ? Request::Req($PageName) : 1;
        $Resp['StartRow'] = ($Resp[$PageName] - 1) * $RowsNum;

        return $Resp;
    }

    public static function PageLimits($PerPage)
    {
        $Page       = Request::Get('page') ? (int)Request::Get('page') : 1;
        $PerPage    = $PerPage;
        $Start      = $PerPage * ($Page - 1);
        $Limit      = ' LIMIT ' . $Start . ', ' . $PerPage . '';
        return $Limit;
    }

    public static function Date($Date, $Hour = true, $Type = 0)
    {
        $Date = explode(' ', $Date);
        $Date[0] = explode('-', $Date[0]);

        switch ($Type) {
            case 1:
                return $Date[0][2] . ' ' . Lang::Get('Months')[(int)$Date[0][1]];
                break;

            default:
                return $Date[0][2] . '/' . $Date[0][1] . '/' . substr($Date[0][0], 2, 2) . ($Hour ? ' ' . substr($Date[1], 0, 5) : '');
                break;
        }
    }

    public static function ChangeDate($Period)
    {
        $CurrentDate = date('Y-m-d H:i:s');
        $ChangeTime = strtotime(date('Y-m-d H:i:s', strtotime($CurrentDate)) . $Period);

        return date('Y-m-d H:i:s', $ChangeTime);
    }

    public function URL($URL)
    {
        $URL = parse_url($URL);

        return '//' . (!is_null($URL['host']) ? $URL['host'] : $URL['path']);
    }

    public static function Clean($String)
    {
        $String = str_replace(' ', '-', $String);
        return preg_replace('/[^A-Za-z0-9\-]/', '', $String);
    }

    public static function CleanNumber($String)
    {
        return preg_replace("/[^0-9]/", "", trim($String));
    }

    public static function Pre($Array, $Exit = true)
    {
        echo '<pre>';
        print_r($Array);
        echo '</pre>';
        if ($Exit)
            exit;
    }

    public static function  GetCurrencySymbol($Id)
    {
        switch ($Id) {
            case 0:
            case 5:
                return '$';
                break;
            case 1:
                return '€';
                break;
            case 2:
                return Lang::Get('l_lari');
                break;
            default :
                return Lang::Get('l_azn');
                break;

        }
    }

    public static function delTree($dir)
    {
        $files = array_diff(scandir($dir), ['.','..']);
        foreach ($files as $file) {
            (is_dir("$dir/$file")) ? self::delTree("$dir/$file") : @unlink("$dir/$file");
        }
        return @rmdir($dir);
    }

    public static function Load($Path)
    {
        $Data = '';
        if($Path == 'lang'){
            if(file_exists(ROOT . LANGS_DIR . Lang::GetLang() . '.js'))
                $Data = file_get_contents(ROOT . LANGS_DIR . Lang::GetLang() . '.js');

        }else{
            if(file_exists(ROOT . 'templates/assets/' . $Path)){
                $Data = file_get_contents(ROOT . 'templates/assets/' . $Path);
                if(preg_match('/\.css/', $Path))
                    $Data = str_replace('../', THEME . 'assets/', $Data);
            }
        }
        return $Data;
    }

    public static function ClearFBCache($Url)
    {
        $FBUrl = 'https://graph.facebook.com';
        $Params = [
            'id' => "$Url",
            'scrape' => true
            ];
        return Curl::Post($FBUrl, $Params);
    }

    public static function GetRoute()
    {
        $Url = isset($_GET['url']) ? $_GET['url'] : NULL;
        $Url = rtrim($Url, '/');
        $Url = filter_var($Url, FILTER_SANITIZE_URL);
        return explode('/', $Url);
    }

    public static function GetValute($valute = 'USD')
    {
        $Client = new SoapClient('http://nbg.gov.ge/currency.wsdl');
        $Date = $Client->GetDate();
        return [
            'Description' => $Client->GetCurrencyDescription($valute),
            'Currency'    => $Client->GetCurrency($valute),
            'Rate'        => $Client->GetCurrencyRate($valute),
            'Change'      => $Client->GetCurrencyChange($valute),
        ];
    }

    static function ScreenShot($Site = 'http://intop.ge/')
    {
        $Image = file_get_contents("https://www.googleapis.com/pagespeedonline/v1/runPagespeed?url=$Site&screenshot=true");
        $Image = json_decode($Image, true);

        $Image = $Image['screenshot']['data'];
        $Image = str_replace(['_', '-'], ['/', '+'], $Image);

        return "<img src=\"data:image/jpeg;base64," . $Image . "\" border='1' />";
    }

    public static function DeleteDirectory($Dir) {
        if (!file_exists($Dir))
            return true;
        if (!is_dir($Dir))
            return unlink($Dir);

        foreach (scandir($Dir) as $File) {
            if ($File == '.' || $File == '..')
                continue;
            if (!self::deleteDirectory($Dir . DIRECTORY_SEPARATOR . $File))
                return false;

        }
        return rmdir($Dir);
    }

    public static function BuildFilterUrl($Key, $Value, $Replace = false)
    {
        Request::UnSetGet('url');
        $GetArray = Request::Get();
        if(isset($GetArray[$Key])){
            if($Replace){
                $GetArray[$Key] = $Value;
            }
            else{
                $ValuesArray = explode(',', $GetArray[$Key]);
                $ValueArray = explode(',', $Value);
                $GetArray[$Key] = implode(',', array_unique(array_merge($ValuesArray, $ValueArray)));
            }
        }else{
            $GetArray[$Key] = $Value;
        }
        return urldecode(http_build_query($GetArray));
    }

    public static function ResetFilterUrl($Key, $Value)
    {
        Request::UnSetGet('url');
        $GetArray = Request::Get();
        if($Key == 'price'){
            unset($GetArray['price_from']);
            unset($GetArray['price_to']);
            return urldecode(http_build_query($GetArray));
        }
        if(isset($GetArray[$Key])){
            $ValuesArray = explode(',', $GetArray[$Key]);
            if(($k = array_search($Value, $ValuesArray)) !== false) {
                unset($ValuesArray[$k]);
            }
            if(count($ValuesArray) == 0){
                unset($GetArray[$Key]);
                return urldecode(http_build_query($GetArray));
            }
            $GetArray[$Key] = implode(',', $ValuesArray);
        }
        return urldecode(http_build_query($GetArray));
    }
}