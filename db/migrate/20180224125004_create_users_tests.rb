class CreateUsersTests < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :tests do |t|
      t.index %i[user_id test_id]
      # t.index [:test_id, :user_id]
    end
  end
end
