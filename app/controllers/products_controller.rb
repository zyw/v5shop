class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :init_form_page, only: [:new,:edit]
  # before_action :user_info,only: [:list]

  layout "front",only:[:list]
  # GET /products
  # GET /products.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @products = Product.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @products = Product.order("created_at desc").page params[:page]
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to :products, notice: '添加产品信息成功。' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def pictureUpload
    uploaded_io = params[:file]
    if !(Dir.exist?(Rails.root.join('public', 'uploads')))
      Dir.mkdir(Rails.root.join('public','uploads'),0700)
    end
    if !(Dir.exist?(Rails.root.join('public', 'uploads','product_imgs')))
      Dir.mkdir(Rails.root.join('public','uploads','product_imgs'),0700)
    end
    img_name = "#{DateTime.now.to_i}#{File.extname(uploaded_io.original_filename)}"
    img_path = "/uploads/product_imgs/#{img_name}"
    File.open(Rails.root.join('public', 'uploads','product_imgs', img_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render json: "{\"status\":1,\"message\":\"上传产品图片成功！\",\"img_path\":\"#{img_path}\"}"
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to :products, notice: '产品信息修改成功。' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: '成功删除产品信息。' }
      format.json { head :no_content }
    end
  end

  # 前端方法

  def list
    pcid = params[:pcid]
    if pcid
      @products = Product.where(status:'1',product_classify_id:pcid)
    else
      @products = Product.where(status:'1')
    end
    @pcs = ProductClassify.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :picture, :feeScale, :charge_type, :status,:unit, :intro)
    end

    def init_form_page
      @proStatues = Dict.where(dict_type_id: 2)
      @chargeTypes = Dict.where(dict_type_id: 1)
      @units = Dict.where(dict_type_id: 5)
      @pcs = ProductClassify.all
    end
end
