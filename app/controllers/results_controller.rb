class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def show
    @result = Result.find(params[:id])
  end
  
  def destroy
    @result = Result.find(params[:id])
    @result.destroy
    redirect_to results_path
  end
end
