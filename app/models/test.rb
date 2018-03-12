class Test < ApplicationRecord
  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'
  belongs_to :category, optional: true

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_category, lambda { |category|
    joins(:category).where(
      categories: { title: category }
    ).order('tests.title DESC')
  }

  def self.category_by_title(category)
    by_category(category).pluck(:title)
  end
end
