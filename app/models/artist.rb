# Song
# belongs_to :artist
# belongs_to :genre
#
# Artist
# has_many :songs
# has_many :genres, through: songs
#
# Genre
# has_many :songs
# has_many :artists, through: songs

class Artist
  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize
    @@all << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    @songs << song
    song.instance_variable_set(:@artist, self)

    if song.genre
      song.genre.artists << self
      song.genre.artists.uniq!

      self.genres << song.genre
    end

    song
  end

  def add_songs(songs_array)
    songs_array.each{ |song| add_song(song) }
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def self.find_by_name(artist_name)
    self.all.find{ |artist| artist.name == artist_name }
  end

  def self.create_by_name(artist_name)
    artist = Artist.new
    artist.name = artist_name
    artist
  end
end
