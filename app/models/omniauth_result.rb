class OmniauthResult
  def initialize(options)
    @auth = options.fetch(:omniauth)
  end

  # Public: The user associated with the omniauth auth hash.
  def user
    @user ||= Admin.where(:provider => @auth.provider, :uid => @auth.uid).first_or_create.tap { |u| u.update_attribute :username, @auth.info.email }
  end
end
