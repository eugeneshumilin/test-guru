class Question < ApplicationRecord
  validates :body, presence: true

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy
end
