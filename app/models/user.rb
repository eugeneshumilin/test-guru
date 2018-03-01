class User < ApplicationRecord
  validates :login, :password, :email, presence: true
  
  has_many :tests_user
  has_many :tests, through: :tests_user
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id'
end
