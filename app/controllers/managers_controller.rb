class ManagersController < ApplicationController
	layout false,:only => ['login','layout']
	# before_filter :check_login,except:[:login]
  def login
  end

  def logout
  end

  def edit
  	
  end
  def index
  	
  end
  def new
  	@manager = Manager.new
  end
  def create
  	Manager.create(params[:manager])
  end
end
