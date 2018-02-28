class AddAuthorIdToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :author_id, :integer
  end
end
