class ModifyFacility < ActiveRecord::Migration[5.2]
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

  def change
    add_column :facilities, :holiday_start_time, :time
    add_column :facilities, :holiday_close_time, :time
    add_column :facilities, :facebook, :string
    add_column :facilities, :twitter, :string
    add_column :facilities, :instagram, :string
  end

end
