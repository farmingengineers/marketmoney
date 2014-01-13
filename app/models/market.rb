class Market
  def initialize(options = {})
    @params = options.fetch(:params)
    @customers = options.fetch(:customers) { Customer.all }
  end

  def valid?
    date_valid? && transactions_valid?
  end

  def save!
    ActiveRecord::Base.transaction do
      @params[:transactions].each do |customer_id, data|
        if data[:amount].present?
          customer = @customers.detect { |c| c.id.to_s == customer_id.to_s }
          transaction = customer.transactions.new
          transaction.occurred_on = @params[:date]
          transaction.amount = data[:amount]
          transaction.description = data[:description]
          transaction.save!
        end
      end
    end
  end

  private

  def date_valid?
    Date.parse(@params[:date])
    true
  rescue
    false
  end

  def transactions_valid?
    @params[:transactions].inject(true) { |valid, (k,v)| valid && transaction_valid?(k,v) }
  end

  def transaction_valid?(customer_id, data)
    customer = @customers.detect { |c| c.id.to_s == customer_id.to_s }
    return false if customer.nil?
    if data[:amount].present?
      Kernel.Float(data[:amount]) rescue false
    else
      true
    end
  end
end
