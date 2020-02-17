class ChangeColumnToPlayer < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :goals, :integer, default: 0
  end
end
