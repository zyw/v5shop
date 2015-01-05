class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @contents = Content.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @contents = Content.order("created_at desc").page params[:page]
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
    @content_classifes = ContentClassify.all
    @contentStatues = Dict.where(dict_type_id: 4)
  end

  # GET /contents/1/edit
  def edit
    @content_classifes = ContentClassify.all
    @contentStatues = Dict.where(dict_type_id: 4)
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to :contents, notice: '内容添加成功！' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def picsUpload
    uploaded_io = params[:file]
    if !(Dir.exist?(Rails.root.join('public', 'uploads')))
      Dir.mkdir(Rails.root.join('public','uploads'),0700)
    end
    if !(Dir.exist?(Rails.root.join('public', 'uploads','content_imgs')))
      Dir.mkdir(Rails.root.join('public','uploads','content_imgs'),0700)
    end
    img_name = "#{DateTime.now.to_i}#{File.extname(uploaded_io.original_filename)}"
    img_path = "/uploads/content_imgs/#{img_name}"
    File.open(Rails.root.join('public', 'uploads','content_imgs', img_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render json: "{\"status\":1,\"message\":\"上传内容图片成功！\",\"img_path\":\"#{img_path}\"}"
  end

  def cattasUpload
    uploaded_io = params[:file]
    if !(Dir.exist?(Rails.root.join('public', 'uploads')))
      Dir.mkdir(Rails.root.join('public','uploads'),0700)
    end
    if !(Dir.exist?(Rails.root.join('public', 'uploads','content_cattas')))
      Dir.mkdir(Rails.root.join('public','uploads','content_cattas'),0700)
    end
    img_name = "#{DateTime.now.to_i}#{File.extname(uploaded_io.original_filename)}"
    img_path = "/uploads/content_cattas/#{img_name}"
    File.open(Rails.root.join('public', 'uploads','content_cattas', img_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    render json: "{\"status\":1,\"message\":\"上传内容附件或视频成功！\",\"img_path\":\"#{img_path}\"}"
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to :contents, notice: '内容修改成功。' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: '内容删除成功。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:name, :content, :nav_id, :stick, :stick_num, :status, :pics, :dispics, :cattas, :manager_id, :content_classify_id, :content_seo, :author, :source_url)
    end
end
