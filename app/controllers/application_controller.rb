class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_variables

  after_action :user_activity

  def set_global_variables
    # navbar search
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) 
  end

  private
  def user_activity
    current_user.try :touch
  end
end
