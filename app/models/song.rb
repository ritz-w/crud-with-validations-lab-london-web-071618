
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, numericality: { only_integer: true, less_than: 2018 }, if: :release_year_true
  validates :artist_name, presence: true
  validate :same_song_twice_validator

  def release_year_true
    self.released == true
  end

  def same_song_twice_validator
    existing_songs = Song.all.select {|song| song.title == self.title}
    check_songs = existing_songs.map {|existing_song| !!existing_song == true && existing_song.artist_name == self.artist_name && existing_song.release_year == self.release_year}
    if check_songs.include?(true)
      errors.add(:release_year, "Same song released in the same year by artist exists.")
    else
      return true
    end
  end

end
