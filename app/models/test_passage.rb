class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question
  before_update :before_update_test_passed
  before_update :before_update_check_timeleft

  def successfull_test?
    test_result_in_percent >= 85
  end

  def test_result_in_percent
    correct_questions * 100 / questions_number
  end

  def accept!(answer_ids)
    unless time_is_over?
      self.correct_questions += 1 if correct_answer?(answer_ids)
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def current_question_number
    questions_number - next_questions.count
  end

  def questions_number
    test.questions.count
  end

  def timer_seconds
    (expires_at - Time.current).to_i
  end

  private

  def expires_at
    created_at + test.timeleft.minutes
  end

  def time_is_over?
    expires_at < Time.current
  end

  def before_update_check_timeleft
    self.current_question = nil if time_is_over?
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    correct_answers_count == correct_answers.where(id: answer_ids).count &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    next_questions.first
  end

  def next_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def before_save_set_next_question
    self.current_question = if completed?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def before_update_test_passed
    self.passed = successfull_test? if completed?
  end
end
