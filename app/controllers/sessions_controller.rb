class SessionsController < ApplicationController
  def new
    session.clear
    redirect_to login_with_google_path
  end

  def create
    auth = OmniauthResult.new(:provider => params[:provider], :omniauth => request.env['omniauth.auth'])
    if user = auth.user
      if user.can_admin?
        self.current_user = user
        redirect_to root_path
      else
        raise "this should be a nice 401 page"
      end
    else
      redirect_to login_with_google_path
    end
  end
end
