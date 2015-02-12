class SuggestsController < ApplicationController
  before_action :set_suggest, only: [:show,:destroy]
  before_action :check_login
  # GET /suggests
  # GET /suggests.json
  def index
    # @suggests = Suggest.all
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @suggests = Suggest.where("content LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @suggests = Suggest.order("created_at desc").page params[:page]
    end
  end

  # GET /suggests/1
  # GET /suggests/1.json
  def show
  end

  # DELETE /suggests/1
  # DELETE /suggests/1.json
  def destroy
    @suggest.destroy
    respond_to do |format|
      format.html { redirect_to :suggests, notice: '意见建议删除成功。' }
      format.json { head :no_content }
    end
  end

=begin
  # GET /suggests/new
  def new
    @suggest = Suggest.new
  end

  # GET /suggests/1/edit
  def edit
  end

  # POST /suggests
  # POST /suggests.json
  def create
    @suggest = Suggest.new(suggest_params)

    respond_to do |format|
      if @suggest.save
        format.html { redirect_to @suggest, notice: 'Suggest was successfully created.' }
        format.json { render :show, status: :created, location: @suggest }
      else
        format.html { render :new }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggests/1
  # PATCH/PUT /suggests/1.json
  def update
    respond_to do |format|
      if @suggest.update(suggest_params)
        format.html { redirect_to @suggest, notice: 'Suggest was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggest }
      else
        format.html { render :edit }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggest
      @suggest = Suggest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
=begin
    def suggest_params
      params.require(:suggest).permit(:name, :phone, :email, :content)
    end
=end

end
