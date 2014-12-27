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
    user = Admin.where(:provider => @auth.provider, :username => @auth.info.email).first_or_initialize
    user.uid = @auth.uid
    user.save!
    user
  end
end
