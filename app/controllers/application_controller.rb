class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def current_manager
    	@current_manager ||= Manager.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end

    def check_login
    	redirect_to :manager_login,:alert => "用户没有登录！" if current_manager.blank?
    end
=begin
    def logged_in?
    	!current_manager.nil?
    end

    def redirect_to_root_if_logged_in
    	redirect_to :root if logged_in?
    end
=end

    # 为前台页面暴露一个检查当前用户的方法
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def check_user_login
      redirect_to :user_login,:alert => "会员没有登录！" if current_user.blank?
    end

    helper_method :current_user

end
