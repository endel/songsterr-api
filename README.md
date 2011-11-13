songsterr-api
===
Simple [Songsterr API](http://www.songsterr.com/a/wa/api) Consumer written in Ruby.

Tested on Ruby 1.9.2

Installation
---
    gem install songsterr

Usage
----

Finding songs.

    # Each case above returns an Array of Song
    Songsterr::Song.where(:pattern => "Marley")
    Songsterr::Song.where(:artist => "Black Sabbath")
    Songsterr::Song.where(:artists => ["Black Sabbath", "Metallica"])

Getting song information:

    # Get first Song from some artist
    song = Songsterr::Song.where(:artist => "Black Sabbath").first
    song.title
    # => "Iron Man"
    song.revision.tracks
    # => [#<Songsterr::Data::Track>, #<Songsterr::Data::Track>, #<Songsterr::Data::Track>, ...]
    song.revision.tracks.first.title
    # => "Geezer Butler"


License
----

This library is distributed under the MIT license. Please see the LICENSE file.
