class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :number
      t.string :position
      t.string :name, null: false
      t.date :birthday
      t.integer :height
      t.integer :weight
      t.integer :goals
      t.string :play_style
      t.string :image
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
