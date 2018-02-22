class AddTestRefToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :test, foreign_key: true
    change_column_null :questions, :test_id, false
  end
end
