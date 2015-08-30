class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :tracks
  
  has_many :recommendations, as: :recommended
end
