class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def current_manager
  	@current_manager ||= Manager.find_by(session[:manager_id]) if session[:manager_id]
  end

  def check_login
  	redirect_to :manager_login,:alert => "用户没有登录！" if current_manager.blank?
  end

  def logged_in?
  	!current_manager.nil?
  end

  def redirect_to_root_if_logged_in
  	redirect_to :root if logged_in?
  end
end
