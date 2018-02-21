class AddQuestionRefToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question, foreign_key: true
    change_column_null :answers, :question_id, false
  end
end
