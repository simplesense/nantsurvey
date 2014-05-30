class StandupdesksController < ApplicationController
  before_action :set_standupdesk, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if user_signed_in?
      @standupdesks = Standupdesk.all
    else
      redirect_to new_user_session_url
    end
  end

  def show
    redirect_to standupdesks_url
  end

  def new
    @standupdesk = current_user.standupdesk.build
  end

  def edit
  end

  def create
    @standupdesk = current_user.standupdesk.build(standupdesk_params)

      if @standupdesk.save
        redirect_to @standupdesk, notice: 'Standupdesk was successfully created.'
      else
        render action: 'new'
      end
  end

  def update
      if @standupdesk.update(standupdesk_params)
        redirect_to @standupdesk, notice: 'Standupdesk was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @standupdesk.destroy
      redirect_to standupdesks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standupdesk
      @standupdesk = Standupdesk.find(params[:id])
    end

    def correct_user
      @standupdesk = current_user.standupdesk.find_by(id: params[:id])
      redirect_to standupdesks_path, notice: "Not authorized to edit this survey" if @standupdesk.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standupdesk_params
      params.require(:standupdesk).permit(:desklocation, :deskwant)
    end
end
