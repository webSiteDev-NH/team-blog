class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :game_date, :date, :after => :commentary
  end
end
