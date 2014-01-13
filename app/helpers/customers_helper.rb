module CustomersHelper
  def money(amount)
    case amount
    when Numeric
      "$%.2f" % amount
    else
      amount
    end
  end

  def date(date)
    date.to_s
  end
end
