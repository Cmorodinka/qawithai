class ApplicationController < ActionController::Base
  before_action :set_locale
  
  def set_locale
    if params[:locale]
      cookies[:locale] = params[:locale]
      I18n.locale = params[:locale]
    elsif cookies[:locale]
      I18n.locale = cookies[:locale]
    else
      I18n.locale = I18n.default_locale
    end
  end
  
end
