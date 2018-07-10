class Artwork < ApplicationRecord
  validates :title, :artist_id, :image_url, presence: true
  
  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare
    
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
  
  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User,
    dependent: :destroy
  
  has_many :comments
end
