class BadgeOptionsService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    return false unless @test_passage.passed
    Badge.find_each do |badge|
      case badge.rule
      when '1'
        add_badge!(badge) if all_tests_category?(badge.rule_parameter)
      when '2'
        add_badge!(badge) if test_first_try?(badge.rule_parameter)
      when '3'
        add_badge!(badge) if test_special_level?(badge.rule_parameter.to_i)
      end
    end
  end

  private

  def add_badge!(badge)
    @user.badges << badge
  end

  def all_tests_category?(category)
    if @test_passage.test.category_id == Category.where(title: category).first.id
      corrects_count = @user.correct_passed_tests.pluck('DISTINCT test_id').count
      Category.find_by(title: category).tests.count == corrects_count
    end
  end

  def test_first_try?(test_title)
    if @test_passage.test.title == test_title && @test_passage.passed
      @user.tests.where(title: test_title).count == 1
    end
  end

  def test_special_level?(level)
    @test_passage.test.level == level if @test_passage.passed
  end
end
