class ContentClassifiesController < ApplicationController
  before_action :set_content_classify, only: [:show, :edit, :update, :destroy]

  # GET /content_classifies
  # GET /content_classifies.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @content_classifies = ContentClassify.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @content_classifies = ContentClassify.order("created_at desc").page params[:page]
    end
  end

  # GET /content_classifies/1
  # GET /content_classifies/1.json
  def show
  end

  # GET /content_classifies/new
  def new
    @content_classify = ContentClassify.new
  end

  # GET /content_classifies/1/edit
  def edit
  end

  # POST /content_classifies
  # POST /content_classifies.json
  def create
    @content_classify = ContentClassify.new(content_classify_params)

    respond_to do |format|
      if @content_classify.save
        format.html { redirect_to :content_classifies, notice: '内容分类添加成功。' }
        format.json { render :show, status: :created, location: @content_classify }
      else
        format.html { render :new }
        format.json { render json: @content_classify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_classifies/1
  # PATCH/PUT /content_classifies/1.json
  def update
    respond_to do |format|
      if @content_classify.update(content_classify_params)
        format.html { redirect_to :content_classifies, notice: '内容分类修改成功。' }
        format.json { render :show, status: :ok, location: @content_classify }
      else
        format.html { render :edit }
        format.json { render json: @content_classify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_classifies/1
  # DELETE /content_classifies/1.json
  def destroy
    @content_classify.destroy
    respond_to do |format|
      format.html { redirect_to content_classifies_url, notice: '内容分类删除成功。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_classify
      @content_classify = ContentClassify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_classify_params
      params.require(:content_classify).permit(:name, :intro)
    end
end
