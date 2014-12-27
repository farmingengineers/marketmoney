class OmniauthResult
  def initialize(options)
    @auth = options.fetch(:omniauth)
  end

  # Public: The user associated with the omniauth auth hash.
  def user
    @user ||= find_or_create_user
  end

  private

  def find_or_create_user
    user = Admin.where(:provider => @auth.provider, :uid => @auth.uid).first_or_create
    user.update_attribute :username, @auth.info.email
    user
  end
end
