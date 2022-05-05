class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_variables

  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  after_action :user_activity

  def set_global_variables
    # navbar search
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) 
  end

  private

  def user_activity
    current_user.try :touch
  end

  def user_not_authorized #pundit
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
