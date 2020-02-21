class Post < ApplicationRecord
  validates :opponent, presence: true
  validates :result, presence: true
  validates :goal, presence: true
  validates :allow, presence: true

  belongs_to :team
  belongs_to :facility, optional: true
  belongs_to :category

  def self.search(search)
    if search
      Post.where('game_date LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
  
  mount_uploader :video, VideoUploader
  
end
