class ChangeUsersTable < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :firstname, :lastname, :login, :isadmin
      t.rename :password, :password_digest
    end
  end
end
