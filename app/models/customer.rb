class Customer < ActiveRecord::Base
  has_many :transactions

  validates :name, :presence => true

  def balance
    0.00
  end

  def to_s
    name
  end
end
