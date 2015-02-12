class ContactsController < ApplicationController

  layout "front",only:[:index,:create]

  def index
    @suggest = Suggest.new
  end

  # POST /suggests
  # POST /suggests.json
  def create
    @suggest = Suggest.new(suggest_params)
    @suggest.ip = request.ip
    respond_to do |format|
      if @suggest.save
        format.html { redirect_to :contact, notice: '感谢您对我们的支持，我们会尽快改进。' }
        format.json { render :show, status: :created, location: @suggest }
      else
        format.html { render :index }
        format.json { render json: @suggest.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggest_params
      params.require(:suggest).permit(:name, :phone, :email, :content)
    end

end
