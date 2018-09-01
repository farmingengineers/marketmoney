class ApplicationController < ActionController::Base
  include CurrentUser

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :admin_required!

  protected

  helper_method :app_title
  def app_title
    ENV['APP_TITLE'] || 'Market Money'
  end

  helper_method :vm
  def vm
    @vm ||= OpenStruct.new
  end

  def admin_required!
    if admin_required?
      unless current_user && current_user.enabled?
        not_found
      end
    end
  end

  def admin_required?
    true
  end

  def not_found
    render :file => 'public/404.html', :status => 404, :layout => false
  end
end
