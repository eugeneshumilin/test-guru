class User < ApplicationRecord
  validates :login, :password, :email, presence: true

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  def passed_tests_by_level(level)
    tests.by_level(level).where(tests_users: { user_id: id })
  end
end
