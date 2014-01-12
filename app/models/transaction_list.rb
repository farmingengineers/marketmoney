class TransactionList
  def initialize(customer)
    @customer = customer
  end

  def starting_balance
    0
  end

  def current_balance
    @customer.balance
  end

  def entries
    @customer.transactions
  end
end
