class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, format: VALID_EMAIL, uniqueness: true

  has_secure_password

  def passed_tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end
