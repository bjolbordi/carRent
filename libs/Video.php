<?php

class video
{
    private $url;
    private $frame;
    private $autoplay;
    private $control;
    private $loop;
    private $width;
    private $height;

    public function __construct($url, $width = 600, $height = 400, $autoplay = 0, $control = 1, $loop = 0)
    {
        $this->url = $url;
        $this->autoplay = $autoplay;
        $this->control = $control;
        $this->loop = $loop;
        $this->width = $width;
        $this->height = $height;
        $this->setFrame();
    }

    private function setFrame()
    {
        if(preg_match('/iframe/', $this->url) > 0){
            $this->setIFrame($this->url);
        }
        else{
            $url = $this->url;
            $url = parse_url($url);
            switch ($url['host'])
            {
                case 'www.youtube.com':
                    $this->setYoutube($url);
                    break;
                case 'rutube.ru':
                    $this->setRutube($url);
                    break;
                case 'vimeo.com':
                    $this->setVimeo($url);
                    break;
                case 'www.myvideo.ge':
                    $this->setMyvideo($url);
                    break;
                case 'my.mail.ru':
                    $this->setMailRu($url);
                    break;
            }
        }

    }

    public function getFrame()
    {
        return $this->frame;
    }

    private function setYoutube($url)
    {
        parse_str($url['query'], $query);
        $id = $query['v'];
        $this->frame = '<iframe width="'.$this->width.'" height="'.$this->height.'" src="https://www.youtube.com/embed/'.$id.'?rel=0&controls='.$this->control.'&showinfo=0&autoplay='.$this->autoplay.'" frameborder="0" allowfullscreen></iframe>';

    }

    private function setVimeo($url)
    {
        $path = explode('/', $url['path']);
        $id = $path[1];
        $this->frame = '<iframe width="'.$this->width.'" height="'.$this->height.'" src="//player.vimeo.com/video/'.$id.'?portrait=0&color=333&autoplay='.$this->autoplay.'&loop='.$this->loop.'&player_id=vimeoplayer"  frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>';
    }

    private function setRutube($url)
    {
        $path = explode('/', $url['path']);
        $id = $path[2];
        $this->frame = '<iframe width="'.$this->width.'" height="'.$this->height.'" src="//rutube.ru/play/embed/'.$id.'" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowfullscreen></iframe>';
    }

    private function setMyvideo($url)
    {
        parse_str($url['query'], $query);
        $id = $query['video_id'];
        $this->frame = '<iframe width="'.$this->width.'" height="'.$this->height.'" src="http://embed.myvideo.ge/flv_player/player.php?video_id='.$id.'" frameborder="0"></iframe>';
    }

    private function setMailRu($url)
    {
        $this->frame = '<iframe width="'.$this->width.'" height="'.$this->height.'" src="https://videoapi.my.mail.ru/videos/embed/'.$url["path"].'" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>';
    }

    private function setIframe($url)
    {
        $this->frame = $url;
    }

}