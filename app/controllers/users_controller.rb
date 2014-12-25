class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_login,only: [:index,:show,:destroy]
  layout "loginReg",only: [:login,:register]
  # GET /users
  # GET /users.json
  def index
     search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @users = User.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @users = User.order("created_at desc").page params[:page]
    end
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :users, notice: '新增用户成功！' }
        format.json { render :users, status: :created, location: @user }
      else
        format.html { render :users }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :users, notice: '修改用户成功！' }
        format.json { render :users, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '用户删除成功！' }
      format.json { head :no_content }
    end
  end

  # 前端方法

  def login
    # @user = User.new
    @title = "会员登录"
  end
  def loginPost
    user = User.find_by(name:params[:name])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to :root
    else
      flash[:alert] = "用户名或密码错误！"
      redirect_to '/users/login'
    end
  end
  def logout
    reset_session
    redirect_to :root
  end

  def register
    @user = User.new
    @title = "会员注册"
  end

  def regPost
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to :users, notice: '新增用户成功！' }
        format.json { render :users, status: :created, location: @user }
      else
        format.html { render :users }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :mobile_phone, :password,:password_confirmation, :portrait)
    end
end
