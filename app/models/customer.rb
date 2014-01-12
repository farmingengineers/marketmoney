class Customer < ActiveRecord::Base
  validates :name, :presence => true

  def balance
    0.00
  end

  def to_s
    name
  end
end
