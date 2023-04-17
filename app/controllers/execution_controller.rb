class ExecutionController < ApplicationController

  def index
    @results = Result.all
  end
end
