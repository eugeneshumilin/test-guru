class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.text :title
      t.text :img

      t.timestamps
    end
  end
end
