class AddIndexUniqueToTests < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, [:title, :level], unique: true
  end
end
