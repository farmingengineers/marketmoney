class Customer < ActiveRecord::Base
  has_many :transactions

  validates :name, :presence => true

  def balance
    transactions.sum(:amount)
  end
end
