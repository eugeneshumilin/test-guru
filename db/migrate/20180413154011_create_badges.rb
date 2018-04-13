class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.text :image
      t.integer :rule_number
      t.text :rule_body

      t.timestamps
    end
  end
end
