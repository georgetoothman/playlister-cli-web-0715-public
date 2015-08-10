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

class Genre
  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize
    @@all << self
    @songs = []
    @artists = []
  end

  def add_song(song)
    @songs << song
    song.instance_variable_set(:@genre, self)

    if song.artist
      song.artist.genres << self

      self.artists << song.artist
      self.artists.uniq!
    end

    song
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

  def self.find_by_name(genre_name)
    self.all.find{ |genre| genre.name == genre_name }
  end

  def self.create_by_name(genre_name)
    genre = Genre.new
    genre.name = genre_name
    genre
  end
end
