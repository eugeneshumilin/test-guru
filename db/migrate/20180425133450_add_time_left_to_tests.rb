class AddTimeLeftToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :timeleft, :integer
  end
end
