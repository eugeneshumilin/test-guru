class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :login
      t.string :password
      t.string :email
      t.boolean :isadmin

      t.timestamps
    end
  end
end
