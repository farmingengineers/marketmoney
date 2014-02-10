class Customer < ActiveRecord::Base
  has_many :transactions

  validates :name, :presence => true

  def balance
    transactions.sum(:amount)
  end

  # Public: Ensure this customer has a slug.
  def slug_me!
    if slug.nil?
      update_attribute :slug, build_slug
    end
  end

  private

  def build_slug
    digest = Digest::MD5.digest("#{id}:#{Time.now.to_i}:#{Rails.application.secrets.secret_key_base}")
    b64digest = Base64.urlsafe_encode64(digest)
    b64digest[0,8]
  end
end
