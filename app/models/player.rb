class Player < ApplicationRecord

  validates :name, presence: true
  validates :position, presence: true

  belongs_to :team

  mount_uploader :image, ImageUploader
  
end
