class ApplicationController < ActionController::Base
  before_action :user

  private

  def user
    @user = if session[:current_user_id].is_a? Integer
              User.find(session[:current_user_id])
            else
              User.first
            end
  end
end
