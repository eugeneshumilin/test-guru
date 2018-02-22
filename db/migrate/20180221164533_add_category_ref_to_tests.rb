class AddCategoryRefToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference :tests, :category, foreign_key: true
    change_column_null :tests, :category_id, false
  end
end
