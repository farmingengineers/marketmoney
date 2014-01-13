class Transaction < ActiveRecord::Base
  belongs_to :customer
  validates :occurred_on, :presence => true
  validates :amount, :numericality => true, :presence => true
end
