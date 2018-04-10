class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback(feedback)
    @feedback = feedback
    @user = feedback.user

    mail to: @admin.email, from: @user.email, subject: 'Обратная связь от пользователя!'
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
