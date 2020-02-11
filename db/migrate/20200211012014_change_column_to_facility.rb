class ChangeColumnToFacility < ActiveRecord::Migration[5.2]
  def up
    change_column :facilities, :start_time, :time
    change_column :facilities, :close_time, :time
    change_column :facilities, :phone_number, :string
  end

  def down
    change_column :facilities, :start_time, :integer
    change_column :facilities, :close_time, :integer
    change_column :facilities, :phone_number, :integer
  end
end
