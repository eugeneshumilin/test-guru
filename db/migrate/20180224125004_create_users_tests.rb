class CreateUsersTests < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :tests
  end
end
