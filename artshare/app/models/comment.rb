class Comment < ApplicationRecord
  validates :user_id, :artwork_id, :body, presence: true
  
  belongs_to :artwork, dependent: :destroy

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy
  
end
