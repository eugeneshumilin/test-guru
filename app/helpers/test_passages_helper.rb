module TestPassagesHelper
  def result_color(percent)
    if @test_passage.successfull_test?
      "<span style='color: green'>#{percent}%</span>".html_safe
    else
      "<span style='color: red'>#{percent}%</span>".html_safe
    end
  end
end
