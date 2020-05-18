class ApplicationController < ActionController::Base
  before_action :user

  private
  def user
    if session[:current_user_id].is_a? Integer
       @user = User.find(session[:current_user_id])
    else
       @user = User.first
    end
  end
end
