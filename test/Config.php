<?php
namespace Tracker;

/**
 * Class Config
 * @package Tracker
 * @author  Lars Nielsen
 * @license CC BY-NC 4.0
 */
class Config {
    // general
    public static $url = 'http://HOSTNAME/listenztracker';
    public static $cronToken = 'CRONTOKEN';

    // spotify
    public static $spotifyKey = 'SPOTIFY_KEY';
    public static $spotifySecret = 'SPOTIFY_SECRET';
    public static $spotifyScopes = [
        'user-read-currently-playing',
        'user-read-recently-played'];

    // lastfm
    public static $lastfmKey = 'LASTFM_KEY'; # change me
    public static $lastfmSecret = 'LASTFM_SECRET'; # change me
}