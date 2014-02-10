class SessionsController < ApplicationController
  def create
    auth = OmniauthResult.new(:omniauth => request.env['omniauth.auth'])
    if user = auth.user
      self.current_user = user
      redirect_to root_path
    else
      raise "this should be a nice 401 page"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  protected

  def protect_against_forgery?
    return false if action_name == 'create'
    super
  end

  def admin_required?
    false
  end
end
