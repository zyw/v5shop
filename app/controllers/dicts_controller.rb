class DictsController < ApplicationController
  before_action :set_dict, only: [:show, :edit, :update, :destroy]

  # GET /dicts
  # GET /dicts.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @dicts = Dict.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @dicts = Dict.order("created_at desc").page params[:page]
    end
  end

  # GET /dicts/1
  # GET /dicts/1.json
  def show
  end

  # GET /dicts/new
  def new
    @dict_types = DictType.all
    @dict = Dict.new
  end

  # GET /dicts/1/edit
  def edit
    @dict_types = DictType.all
  end

  # POST /dicts
  # POST /dicts.json
  def create
    @dict = Dict.new(dict_params)

    respond_to do |format|
      if @dict.save
        format.html { redirect_to :dicts, notice: '新增字典成功！' }
        format.json { render :show, status: :created, location: @dict }
      else
        format.html { render :new }
        format.json { render json: @dict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dicts/1
  # PATCH/PUT /dicts/1.json
  def update
    respond_to do |format|
      if @dict.update(dict_params)
        format.html { redirect_to :dicts, notice: '修改字典成功！' }
        format.json { render :show, status: :ok, location: @dict }
      else
        format.html { render :edit }
        format.json { render json: @dict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dicts/1
  # DELETE /dicts/1.json
  def destroy
    @dict.destroy
    respond_to do |format|
      format.html { redirect_to dicts_url, notice: '删除字典成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dict
      @dict = Dict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dict_params
      params.require(:dict).permit(:name, :dict_type_id, :intro)
    end
end
