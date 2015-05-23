class CustomerList
  def initialize(customers: nil, hide_zeroes: false)
    @hide_zeroes = hide_zeroes
    @customers = customers || Customer.all
  end

  def each
    @customers.each do |customer|
      unless @hide_zeroes && customer.balance < 0.01
        yield CustomerInList.new(customer)
      end
    end
  end

  class CustomerInList
    include CustomersHelper

    def initialize(customer)
      @customer = customer
    end

    def balance
      @balance ||= money @customer.balance
    end

    def last_transaction
      @last_transaction ||=
        if transaction = @customer.transactions.last
          transaction.to_s
        else
          ""
        end
    end

    def to_s
      name
    end

    def respond_to?(method)
      super || @customer.respond_to?(method)
    end

    def method_missing(*args)
      @customer.send(*args)
    end
  end
end
