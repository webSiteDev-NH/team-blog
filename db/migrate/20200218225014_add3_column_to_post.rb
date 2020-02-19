class Add3ColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :venue, :string, after: :team_id
  end
end
