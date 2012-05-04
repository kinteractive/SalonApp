class AddCategoryIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :category_id, :integer
    add_index :services, [:category_id, :created_at]
  end
end
