# ListenzTracker Docker Image

This Docker image sets up a running instance of the [ListenzTracker
script](https://liste.nz), a script to scrobble [Spotify](https://spotify.com)
tracks to [Last.fm](http://last.fm) using both APIs and thus saving you from
setting up scrobbling in every Spotify instance. It also enables you to scrobble
tracks from the Spotify Web Player (which isn't possible in the player itself).

## Setup

### Spotify

Get a [Spotify developer account](https://developer.spotify.com) or log in to
your existing account. Create a new application. Add
`yourdomain.com/listenztracker/setupCallback.php?spotify` as redirect URL and
replace `yourdomain.com` with your own domain name.

### Lastfm

Register at [Last.fm](https://last.fm/de/api) and create a new application.

### ListenzTracker

Edit Config.php.sample, add the required keys and put it in separate dir (e.g.
`/opt/listenz`). The Docker entrypoint script will pick up this config when the
directory is mounted to `/listenz` in the container.

## Initialization

Start the Docker container

    docker run --rm --name listenz -v /opt/listenz:/listenz -p 8080:80 egoexpress/listenz:1.0

Open `http://yourdomain.com:8080/listenztracker/index.php` in your browser and
click both authenticate links and follow the instructions given by Spotify &
Lastfm.

