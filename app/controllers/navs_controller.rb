class NavsController < ApplicationController
  before_action :set_nav, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  # GET /navs
  # GET /navs.json
  def index
    @navs = Nav.find_by_sql("select * from navs order by concat(parent_ids,id) asc")
  end

  # GET /navs/1
  # GET /navs/1.json
  def show
  end

  # GET /navs/new
  def new
    @nav = Nav.new
    pid = params['pid']
    if pid == nil
      @nav.parent_id = 0
      @nav.parent_ids = '0/'
      @parentLabel = '一级区划'
    else
      nav = Nav.find_by(id: pid)
      @nav.parent_id = nav.id
      @nav.parent_ids = "#{nav.parent_ids}#{nav.id}/"
      @parentLabel = nav.name
    end
  end

  # GET /navs/1/edit
  def edit
    if @nav.parent_id == 0
      @parentLabel = '一级区划'
    else
      nav = Nav.find_by(@nav.parent_id)
      @parentLabel = nav.name
    end
  end

  # POST /navs
  # POST /navs.json
  def create
    @nav = Nav.new(nav_params)

    respond_to do |format|
      if @nav.save
        format.html { redirect_to :navs, notice: '导航添加成功。' }
        format.json { render :show, status: :created, location: @nav }
      else
        format.html { render :new }
        format.json { render json: @nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navs/1
  # PATCH/PUT /navs/1.json
  def update
    respond_to do |format|
      if @nav.update(nav_params)
        format.html { redirect_to :navs, notice: '导航修改成功。' }
        format.json { render :show, status: :ok, location: @nav }
      else
        format.html { render :edit }
        format.json { render json: @nav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navs/1
  # DELETE /navs/1.json
  def destroy
    @nav.destroy
    respond_to do |format|
      format.html { redirect_to navs_url, notice: '导航删除成功。' }
      format.json { head :no_content }
    end
  end

  def tree_json
    render json: nav_tree(nil)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nav
      @nav = Nav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nav_params
      params.require(:nav).permit(:name, :url, :open_way, :sort_num, :status, :parent_id, :parent_ids, :intro)
    end

    def nav_tree(navs)
      if !navs
        navs = Nav.where(parent_id:0)
      end
      treeArray = []
      navs.each do |nav|
        subNav = Nav.where(parent_id:nav.id)
        treeNode = {id:nav.id,name:nav.name}
        if subNav && !subNav.empty?
          treeNode[:children] = nav_tree(subNav)
        end
        treeArray.push(treeNode)
      end
      return treeArray
    end
end
