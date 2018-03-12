class User < ApplicationRecord
  validates :login, :password, :email, presence: true

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  def passed_tests_by_level(level)
    tests.by_level(level)
  end
end
