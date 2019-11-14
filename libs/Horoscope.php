<?php

/**
 *
 * PHP version 5
 *
 * @category   Ads manager
 * @package    Web cms
 * @author     Tornike Tsikhelishvili (zixela) mail@zixela.com
 * @copyright  2014 zixela
 * @license    http://zixela.com/license.txt
 * @version    1.0
 * @link       http://zixela.com
 *
 */

// No direct access.
defined('PARENT') or die();

class Horoscope
{
    private $url = 'http://www.astrostar.ru/horoscopes/main/';
    private $signs = array('all', 'oven', 'telets', 'bliznetsi', 'rac', 'lev', 'deva', 'vesy', 'scorpion', 'strelets', 'kozerog', 'vodoley', 'riby');

    public function getStarSign($birthday='')
    {
        if($birthday=='')
        {
            return false;
        }
        $date = strtotime($birthday);
        $zodiac[356] = array("id" => 10, "alias" => "capricorn", "name" => "თხის რქა");
        $zodiac[326] = array("id" => 9, "alias" => "sagittarius",  "name" => "მშვილდოსანი");
        $zodiac[296] = array("id" => 8, "alias" => "scorpio", "name" => "მორიელი");
        $zodiac[266] = array("id" => 7, "alias" => "libra", "name" => "სასწორი");
        $zodiac[235] = array("id" => 6, "alias" => "virgo", "name" => "ქალწული");
        $zodiac[203] = array("id" => 5, "alias" => "leo", "name" => "ლომი");
        $zodiac[172] = array("id" => 4, "alias" => "cancer", "name" => "კირჩხიბი");
        $zodiac[140] = array("id" => 3, "alias" => "gemini", "name" => "ტყუპები");
        $zodiac[111] = array("id" => 2, "alias" => "taurus", "name" => "კურო");
        $zodiac[78]  = array("id" => 1, "alias" => "aries", "name" => "ვერძი");
        $zodiac[51]  = array("id" => 12, "alias" => "pisces", "name" => "თევზები");
        $zodiac[20]  = array("id" => 11, "alias" => "aquarius", "name" => "მერწყული");
        $zodiac[0]   = array("id" => 10, "alias" => "capricorn", "name" => "თხის რქა");

        if (!$date)
        {
            $date = time();
        }
        $dayOfTheYear = date("z",$date);
        $isLeapYear = date("L",$date);

        if ($isLeapYear && ($dayOfTheYear > 59))
        {
            $dayOfTheYear = $dayOfTheYear - 1;
        }
        foreach($zodiac as $day => $sign)
        {
            if ($dayOfTheYear > $day)
            {
                break;
            }
        }
        return $sign;
    }
    public function getChineseHoroscope($birthday){
        if($birthday=='')
        {
            return false;
        }
        $zodiac = false;
        $year = date('Y', strtotime($birthday));
        switch (($year - 4) % 12) {
            case  0: $zodiac = array('id' => 1, 'alias' => 'rat', 'name' => 'ვირთხა');       break;
            case  1: $zodiac = array('id' => 2, 'alias' => 'ox', 'name' => 'ხარი');            break;
            case  2: $zodiac = array('id' => 3, 'alias' => 'tiger', 'name' => 'ვეფხვი');     break;
            case  3: $zodiac = array('id' => 4, 'alias' => 'rabbit', 'name' => 'კურდღელი');    break;
            case  4: $zodiac = array('id' => 5, 'alias' => 'dragon', 'name' => 'დრაკონი');    break;
            case  5: $zodiac = array('id' => 6, 'alias' => 'snake', 'name' => 'გველი');     break;
            case  6: $zodiac = array('id' => 7, 'alias' => 'horse', 'name' => 'ცხენი');     break;
            case  7: $zodiac = array('id' => 8, 'alias' => 'goat', 'name' => 'თხა');  break;
            case  8: $zodiac = array('id' => 9, 'alias' => 'monkey', 'name' => 'მაიმუნი');    break;
            case  9: $zodiac = array('id' => 10, 'alias' => 'rooster', 'name' => 'მამალი');   break;
            case 10: $zodiac = array('id' => 11, 'alias' => 'dog', 'name' => 'ძაღლი');   break;
            case 11: $zodiac = array('id' => 12, 'alias' => 'pig', 'name' => 'ღორი');   break;
        }
        return $zodiac;
    }
    //$date = day, tomorrow, week, month, year
    private function parseHoroscope($url, $signs, $date){
        $id = 0;

        foreach ($signs as $s) {
            // create curl and add url to this one
            $ch = curl_init($url.$s.'/'.$date.'.html');
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $curl_scraped_page = curl_exec($ch);
            // initialize simple HTML DOM instance
            $html = new simple_html_dom();
            $html->load($curl_scraped_page);

            // check if element with forecast exist
            if ($html->find('div[class=horoscopes-single-content]', 0)) {

                echo $s;
                echo '<br>';
                echo '</br>';

                foreach($html->find('div[class=horoscopes-single-content]', 0)->find('div[class=horoscopes-single-title]') as $p)
                {
                    echo $p->plaintext;
                    echo '<br>';
                    echo '</br>';
                    echo $p->next_sibling()->plaintext;
                    echo '<br>';
                    echo '</br>';
                }

                $id++;
            } else {
                printf("Horoscope not found\n");
            }

        }
    }
    public function parse($date)
    {
            $this->parseHoroscope($this->url, $this->signs, $date);
    }

}