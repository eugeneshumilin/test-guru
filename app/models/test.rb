class Test < ApplicationRecord
  has_many :questions
  has_many :tests_user
  has_many :users, through: :tests_user
  belongs_to :author, class_name: 'User'
  belongs_to :category

  def self.titles_by_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where(
      categories: { title: category }
    ).order('tests.title DESC').pluck('title')
  end
end
