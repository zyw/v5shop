class AdminDivisionsController < ApplicationController
  before_action :set_admin_division, only: [:show, :edit, :update, :destroy]

  # GET /admin_divisions
  # GET /admin_divisions.json
  def index
    search_txt = params['search_txt']
    if search_txt != nil && search_txt != ""
      @search_txt = search_txt
      @admin_divisions = AdminDivision.where("name LIKE '%#{search_txt}%'").order("created_at desc").page params[:page]
    else
      @admin_divisions = AdminDivision.order("created_at desc").page params[:page]
    end
  end

  # GET /admin_divisions/1
  # GET /admin_divisions/1.json
  def show
  end

  # GET /admin_divisions/new
  def new
    @admin_division = AdminDivision.new
    pid = params['pid']
    if pid == nil
      @admin_division.parent_id = 0
      @parentLabel = '一级区划'
    else
      ad = AdminDivision.find_by(pid)
      @admin_division.parent_id = ad.id
      @parentLabel = ad.name
    end
  end

  # GET /admin_divisions/1/edit
  def edit
    if @admin_division.parent_id == 0
      @parentLabel = '一级区划'
    else
      ad = AdminDivision.find_by(@admin_division.parent_id)
      @parentLabel = ad.name
    end
  end

  # POST /admin_divisions
  # POST /admin_divisions.json
  def create
    @admin_division = AdminDivision.new(admin_division_params)

    respond_to do |format|
      if @admin_division.save
        format.html { redirect_to :admin_divisions, notice: 'Admin division was successfully created.' }
        format.json { render :show, status: :created, location: @admin_division }
      else
        format.html { render :new }
        format.json { render json: @admin_division.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_divisions/1
  # PATCH/PUT /admin_divisions/1.json
  def update
    respond_to do |format|
      if @admin_division.update(admin_division_params)
        format.html { redirect_to :admin_divisions, notice: 'Admin division was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_division }
      else
        format.html { render :edit }
        format.json { render json: @admin_division.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_divisions/1
  # DELETE /admin_divisions/1.json
  def destroy
    @admin_division.destroy
    respond_to do |format|
      format.html { redirect_to admin_divisions_url, notice: 'Admin division was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_division
      @admin_division = AdminDivision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_division_params
      params.require(:admin_division).permit(:name, :parent_id)
    end
end
