class Transaction < ActiveRecord::Base
  belongs_to :customer
  validates :occurred_on, :amount, :customer_id, :presence => true
end
