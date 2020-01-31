class AddCategoryToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_index :posts, :category_id
    remove_reference :posts, :category
  end
end
