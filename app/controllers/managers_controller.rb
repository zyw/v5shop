class ManagersController < ApplicationController
	layout false,:only => ['login','layout']
	before_action :check_login,except:[:login,:loginPost]
  def login
  end

  def loginPost
    manager = Manager.find_by(name:params[:name])
    if manager && manager.authenticate(params[:password])
        session[:manager_id] = manager.id
        redirect_to '/admins/index'
    else
      flash[:alert] = "用户名或密码错误！"
      redirect_to :manager_login
    end
  end

  def logout
  end

  def edit
  	@manager = Manager.find(params[:id])
  end
  def index
  	@managers = Manager.all
  end
  def new
  	@manager = Manager.new
  end
  def create
  	manager = Manager.new(manager_params)
    manager.loginNum = 0;
    manager.save
    redirect_to :managers
  end

  private 

  def manager_params
    params.require(:manager).permit(:name,:email,:password,:password_confirmation,:icon)
  end
end
