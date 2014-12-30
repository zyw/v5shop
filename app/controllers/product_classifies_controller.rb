class ProductClassifiesController < ApplicationController
  before_action :set_product_classify, only: [:show, :edit, :update, :destroy]

  # GET /product_classifies
  # GET /product_classifies.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @product_classifies = ProductClassify.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @product_classifies = ProductClassify.order("created_at desc").page params[:page]
    end
  end

  # GET /product_classifies/1
  # GET /product_classifies/1.json
  def show
  end

  # GET /product_classifies/new
  def new
    @product_classify = ProductClassify.new
  end

  # GET /product_classifies/1/edit
  def edit
  end

  # POST /product_classifies
  # POST /product_classifies.json
  def create
    @product_classify = ProductClassify.new(product_classify_params)

    respond_to do |format|
      if @product_classify.save
        format.html { redirect_to :product_classifies, notice: '产品分类添加成功。' }
        format.json { render :show, status: :created, location: @product_classify }
      else
        format.html { render :new }
        format.json { render json: @product_classify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_classifies/1
  # PATCH/PUT /product_classifies/1.json
  def update
    respond_to do |format|
      if @product_classify.update(product_classify_params)
        format.html { redirect_to :product_classifies, notice: '产品分类修改成功。' }
        format.json { render :show, status: :ok, location: @product_classify }
      else
        format.html { render :edit }
        format.json { render json: @product_classify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_classifies/1
  # DELETE /product_classifies/1.json
  def destroy
    @product_classify.destroy
    respond_to do |format|
      format.html { redirect_to product_classifies_url, notice: '产品分类删除成功。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_classify
      @product_classify = ProductClassify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_classify_params
      params.require(:product_classify).permit(:name, :intro)
    end
end
