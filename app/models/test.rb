class Test < ApplicationRecord
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  has_many :questions
  has_many :tests_user
  has_many :users, through: :tests_user
  belongs_to :author, class_name: 'User'
  belongs_to :category

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, lambda { |category|
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(
      categories: { title: category }
    ).order('tests.title DESC')
  }

  def self.category_by_title(category)
    Test.by_category(category).pluck(:title)
  end
end
