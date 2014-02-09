class ApplicationController < ActionController::Base
  include CurrentUser

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  helper_method :app_title
  def app_title
    ENV['APP_TITLE'] || 'Market Money'
  end
end
