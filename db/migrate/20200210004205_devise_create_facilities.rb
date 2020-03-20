# frozen_string_literal: true

class DeviseCreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :facility_name,      null: false
      t.string :address
      t.string :phone_number
      t.time :start_time
      t.time :close_time
      t.time :holiday_start_time
      t.time :holiday_close_time
      t.text :access
      t.integer :courts
      t.string :image
      t.string :url
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.float :latitude
      t.float :longitude

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :facilities, :email,                unique: true
    add_index :facilities, :reset_password_token, unique: true
    # add_index :facilities, :confirmation_token,   unique: true
    # add_index :facilities, :unlock_token,         unique: true
  end
end
