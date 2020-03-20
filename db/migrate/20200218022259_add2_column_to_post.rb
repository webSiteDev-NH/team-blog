class Add2ColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :facility, foreign_key: true
  end
end
