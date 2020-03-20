class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :representative, presence: true
  validates :team_name, presence: true

  has_many :posts, dependent: :destroy
  has_many :players, dependent: :destroy

  def goals_confirmation
    @total_goal = Post.where(team_id: @team).sum(:goal)
    @player_total_goal = Player.where(team_id: @team).sum(:goals)
    @goals_confirmation = @total_goal - @player_total_goal
  end
end
