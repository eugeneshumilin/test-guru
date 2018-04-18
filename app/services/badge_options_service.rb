class BadgeOptionsService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      case badge.rule_number
      when 1
        add_badge!(badge) if all_tests_category?(badge.rule_body)
      when 2
        add_badge!(badge) if test_first_try?(badge.rule_body)
      when 3
        add_badge!(badge) if test_special_level?(badge.rule_body.to_i)
      end
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end

  def all_tests_category?(category)
    if @test_passage.test.category.title == category
      corrects_count = TestPassage.correct_passed_tests(@user)
                                  .pluck('DISTINCT test_id')
                                  .count
      Category.find_by(title: category).tests.count == corrects_count
    end
  end

  def test_first_try?(test_title)
    if @test_passage.test.title == test_title && @test_passage.passed
      @user.tests.where(title: test_title).count == 1
    end
  end

  def test_special_level?(level)
    if @test_passage.passed
      @test_passage.test.level == level
    end
  end
end