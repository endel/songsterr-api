require File.expand_path('spec/spec_helper')

describe Songsterr do
  context Songsterr::Song do
    results = nil
    song = nil
    song_revision = nil
    track = nil
    artist = nil

    it 'should query webservices' do
      Songsterr::Song.where(:pattern => "Marley").should be_a_kind_of Array

      results = Songsterr::Song.where(:artist => "Black Sabbath")
      results.should be_a_kind_of Array

      results2 = Songsterr::Song.where(:artists => ["Black Sabbath", "Metallica"])
      results2.should be_a_kind_of Array
      results2.length.should_not == results.length
    end

    it 'should be valid Song' do
      song = results.first
      song.should be_an_instance_of Songsterr::Song
      song.title.should be_a_kind_of String
    end

    it 'should be a valid Artist' do
      artist = song.artist
      artist.name.should be_a_kind_of String
      artist.should be_an_instance_of Songsterr::Artist
      artist.songs.should be_a_kind_of Array
      artist.songs.first.should be_an_instance_of Songsterr::Song
    end

    it 'should be a valid SongRevision' do
      song_revision = song.revision
      song_revision.should be_an_instance_of Songsterr::Data::SongRevision

      song_revision.tracks.should be_a_kind_of Array
      song_revision.most_popular_track.should be_an_instance_of Songsterr::Data::Track
      song_revision.guitar_pro_tab.should be_a_kind_of String
      track = song_revision.tracks.first
    end

    it 'should be a valid Track' do
      track.should be_an_instance_of Songsterr::Data::Track
      track.instrument.should be_an_instance_of Songsterr::Data::Instrument
      track.instrument.name.should be_a_kind_of String
      track.title.should be_a_kind_of String
      track.tuning.should be_a_kind_of String
      track.has_lyrics?.should be_a_kind_of Boolean
    end
  end
end
