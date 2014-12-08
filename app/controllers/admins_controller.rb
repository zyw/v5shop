class AdminsController < ApplicationController
	before_action :check_login,only:[:index,:show,:new]
  def index
  end

  def show
  end

  def new
  end
end
