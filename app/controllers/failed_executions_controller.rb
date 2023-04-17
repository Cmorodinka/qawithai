class FailedExecutionsController < ApplicationController
  def index
    @results = Result.where(pass: false)
  end  
end
