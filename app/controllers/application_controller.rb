class ApplicationController < ActionController::Base
  include Pundit
  before_action :set_locale


  protect_from_forgery with: :exception

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end
