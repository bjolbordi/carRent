<?php

class CacheFile
{

    private $cache_path = 'cache/';
    private $cache_life_time = 900;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->cache_path = FILE_CACHE_DIR;
        $this->cache_life_time = FILE_CACHE_LIFE_TIME;
    }

    // ------------------------------------------------------------------------
    /**
     * Fetch from cache
     * @param    mixed        unique key id
     * @return    mixed        data on success/false on failure
     */
    public function get($id)
    {
        if (!file_exists($this->cache_path . $id . '.txt'))
            return false;

        $data = file_get_contents($this->cache_path . $id . '.txt');
        $data = unserialize($data);
        if (time() > $data['time'] + $data['ttl'])
        {
            unlink($this->cache_path . $id . '.txt');
            return false;
        }
        return $data['data'];
    }

    // ------------------------------------------------------------------------
    /**
     * Save into cache
     * @param    string        unique key
     * @param    mixed        data to store
     * @param    int            length of time (in seconds) the cache is valid
     *                        - Default is 60 seconds
     * @return    boolean        true on success/false on failure
     */
    public function set($id, $data)
    {
        $ttl = $this->cache_life_time;
        $contents = array ('time' => time(), 'ttl' => $ttl, 'data' => $data);
        if (file_put_contents($this->cache_path . $id . '.txt', serialize($contents)))
        {
            @chmod($this->cache_path . $id . '.txt', 0777);
            return true;
        }
        return false;
    }

    // ------------------------------------------------------------------------
    /**
     * Delete from Cache
     * @param    mixed        unique identifier of item in cache
     * @return    boolean        true on success/false on failure
     */
    public function delete($id)
    {
        return unlink($this->cache_path . $id);
    }

    // ------------------------------------------------------------------------
    /**
     * Clean the Cache
     * @return    boolean        false on failure/true on success
     */
    public function clean()
    {
        $files = glob($this->cache_path.'*'); // get all file names
        if(count($files) > 0)
        {
            foreach ($files as $file)
            {
                if (is_file($file))
                {
                    unlink($file); // delete file
                }
            }
            return true;
        }
        else
        {
            return false;
        }
    }

    // ------------------------------------------------------------------------
    /**
     * Get Cache Metadata
     * @param    mixed        key to get cache metadata on
     * @return    mixed        FALSE on failure, array on success.
     */
    public function get_metadata($id)
    {
        if (!file_exists($this->cache_path . $id. '.txt'))
            return false;

        $data = file_get_contents($this->cache_path . $id . '.txt');
        $data = unserialize($data);
        if (is_array($data))
        {
            $mtime = filemtime($this->cache_path . $id . '.txt');
            if (!isset($data['ttl']))
                return false;
            return array ('expire' => $mtime + $data['ttl'], 'mtime' => $mtime);
        }
        return false;
    }

    // ------------------------------------------------------------------------
    /**
     * Is supported
     * In the file driver, check to see that the cache directory is indeed writable
     * @return boolean
     */
    public function is_supported()
    {
       return is_writable($this->cache_path);
    }
    // ------------------------------------------------------------------------
}
