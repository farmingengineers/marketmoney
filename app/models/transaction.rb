class Transaction < ApplicationRecord
  include CustomersHelper

  belongs_to :customer
  validates :occurred_on, :presence => true
  validates :amount, :numericality => true, :presence => true

  default_scope { order(:occurred_on) }
  scope :since, ->(date) { where("occurred_on > :date", :date => date) }

  def to_s
    if amount > 0
      "signed up for #{money amount} on #{date occurred_on}"
    else
      "spent #{money -amount} on #{date occurred_on}"
    end
  end
end
