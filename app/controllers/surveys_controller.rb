class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)
      if @survey.save
        redirect_to @survey, notice: 'Survey was successfully created.'
      else
        render action:new
    end
  end

  def update
      if @survey.update(survey_params)
        redirect_to @survey, notice: 'Survey was successfully updated.'
      else
        render action:edit
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
      redirect_to surveys_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:description)
    end
end
