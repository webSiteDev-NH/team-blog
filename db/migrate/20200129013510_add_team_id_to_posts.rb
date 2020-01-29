class AddTeamIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :team, foreign_key: true
  end
end
