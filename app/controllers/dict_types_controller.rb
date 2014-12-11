class DictTypesController < ApplicationController
  before_action :set_dict_type, only: [:show, :edit, :update, :destroy]

  # GET /dict_types
  # GET /dict_types.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @dict_types = DictType.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @dict_types = DictType.order("created_at desc").page params[:page]
    end
  end
  # GET /dict_types/1
  # GET /dict_types/1.json
  def show
  end

  # GET /dict_types/new
  def new
    @dict_type = DictType.new
  end

  # GET /dict_types/1/edit
  def edit
  end

  # POST /dict_types
  # POST /dict_types.json
  def create
    @dict_type = DictType.new(dict_type_params)

    respond_to do |format|
      if @dict_type.save
        format.html { redirect_to :dict_types, notice: '新增字典类型成功！' }
        format.json { render :show, status: :created, location: @dict_type }
      else
        format.html { render :new }
        format.json { render json: @dict_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dict_types/1
  # PATCH/PUT /dict_types/1.json
  def update
    respond_to do |format|
      if @dict_type.update(dict_type_params)
        format.html { redirect_to :dict_types, notice: '修改字典类型成功！' }
        format.json { render :show, status: :ok, location: @dict_type }
      else
        format.html { render :edit }
        format.json { render json: @dict_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dict_types/1
  # DELETE /dict_types/1.json
  def destroy
    @dict_type.destroy
    respond_to do |format|
      format.html { redirect_to dict_types_url, notice: '删除字典类型成功！' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dict_type
      @dict_type = DictType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dict_type_params
      params.require(:dict_type).permit(:name, :intro)
    end
end
