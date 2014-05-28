class StandupdesksController < ApplicationController
  before_action :set_standupdesk, only: [:show, :edit, :update, :destroy]

  def index
    @standupdesks = Standupdesk.all
  end

  def show
  end

  def new
    @standupdesk = Standupdesk.new
  end

  def edit
  end

  def create
    @standupdesk = Standupdesk.new(standupdesk_params)

      if @standupdesk.save
        redirect_to @standupdesk, notice: 'Standupdesk was successfully created.'
      else
        render action:new
      end
  end

  def update|
      if @standupdesk.update(standupdesk_params)
        redirect_to @standupdesk, notice: 'Standupdesk was successfully updated.'
      else
        render action:edit
      end
  end

  def destroy
    @standupdesk.destroy
      redirect_to standupdesks_url, notice: 'Standupdesk was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standupdesk
      @standupdesk = Standupdesk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standupdesk_params
      params.require(:standupdesk).permit(:desklocation, :deskwant)
    end
end
