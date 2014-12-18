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
    reset_session
    redirect_to :manager_login
  end
  
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @managers = Manager.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @managers = Manager.order("created_at desc").page params[:page]
    end
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
  def edit
    @manager = Manager.find(params[:id])
  end
  def update
    manager = Manager.find(params[:id])
    if manager.update_attributes(manager_params)
      flash[:message] = "管理员信息修改成功！"
      redirect_to :managers
    else
      flash[:alert] = manager.errors.full_messages
      redirect_to :managers
    end

    
  end

  def destroy
    Manager.destroy(params[:id])
    flash[:message] = "删除管理员成功！"
    redirect_to :managers
  end

  def resetPassword
    manager = Manager.find_by(id:params['manager_id'])
    manager.password = params['password']
    manager.password_confirmation = params['password_confirmation']
    manager.save
    flash[:message] = "密码修改成功！"
    redirect_to :managers
  end

  private 

  def manager_params
    params.require(:manager).permit(:name,:email,:password,:password_confirmation,:icon)
  end
end
