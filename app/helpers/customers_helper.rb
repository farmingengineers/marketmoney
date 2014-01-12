module CustomersHelper
  def money(amount)
    "$%.2f" % amount
  end

  def date(date)
    date.to_s
  end
end
