class User < ApplicationRecord
  has_many :tests_user
  has_many :tests, through: :tests_user
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'

  def user_tests_by_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id').where(
      tests_users: { user_id: id }, level: level
    )
  end
end
