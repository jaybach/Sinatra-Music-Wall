class Song < ActiveRecord::Base

  validates :song_title, presence: true
  validates :author, presence: true

end