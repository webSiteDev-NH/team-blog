class Post < ApplicationRecord
  validates :opponent, presence: true
  validates :result, presence: true
  validates :goal, presence: true
  validates :allow, presence: true

end
