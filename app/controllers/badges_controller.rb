class BadgesController < ApplicationController
  def index
    @badges = current_user.badges.distinct
  end
end
