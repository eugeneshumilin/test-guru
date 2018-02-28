class AddBodyToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :body, :text
  end
end
