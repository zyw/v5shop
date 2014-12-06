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
  	manager = Manager.new(manager_params)
    manager.save
    redirect_to :managers
  end

  private 

  def manager_params
    params.require(:manager).permit(:name,:email,:password,:password_confirmation,:icon)
  end
end
