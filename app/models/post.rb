class Post < ApplicationRecord
  validates :opponent, presence: true
  validates :result, presence: true
  validates :goal, presence: true
  validates :allow, presence: true

  belongs_to :team
  belongs_to :category

  mount_uploader :video, VideoUploader
  
end
