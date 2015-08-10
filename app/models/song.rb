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

class Song
  # code here
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize
    @@all << self
  end

  ## INSTANCE
  ## song = Song.new
  ## song.count

  ## CLASS
  ## Song.count

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def self.find_by_name(song_name)
    self.all.find{ |song| song.name == song_name }
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def to_s
    # "Miley Cyrus - We Can't Stop [Pop]"
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def genre=(genre)
    genre.add_song(self)
  end

  def artist=(artist)
    artist.add_song(self)
  end
end
