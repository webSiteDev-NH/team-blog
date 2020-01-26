class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :opponent, null: false
      t.string :result, default: "", null: false
      t.integer :goal
      t.integer :allow
      t.text :scorer
      t.text :commentary

      t.timestamps
    end
  end
end