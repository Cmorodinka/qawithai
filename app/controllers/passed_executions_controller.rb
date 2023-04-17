class PassedExecutionsController < ApplicationController
  def index
    @results = Result.all.order(created_at: :desc)
  end
end
