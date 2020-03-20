class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :venue
      t.string :opponent, null: false
      t.string :result, default: "", null: false
      t.integer :goal, default: 0
      t.integer :allow, default: 0
      t.text :scorer
      t.text :commentary
      t.date :game_date
      t.string :video
      t.boolean :goals_check
      t.timestamps
    end
  end
end