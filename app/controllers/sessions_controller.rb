class SessionsController < ApplicationController
  def new
    session.clear
    redirect_to login_with_google_path
  end

  def create
    auth = OmniauthResult.new(:omniauth => request.env['omniauth.auth'])
    if user = auth.user
      self.current_user = user
      redirect_to root_path
    else
      raise "this should be a nice 401 page"
    end
  end

  protected

  def protect_against_forgery?
    return false if action_name == 'create'
    super
  end
end
