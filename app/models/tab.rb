class Tab < ApplicationRecord
  validates_presence_of :name, :encoded_song
  validates_uniqueness_of :name
end
