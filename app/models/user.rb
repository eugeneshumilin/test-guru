class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :gists
  has_many :feedbacks

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end

  def full_name
    first_name + " " + last_name
  end

  def admin?
    is_a?(Admin)
  end
end
