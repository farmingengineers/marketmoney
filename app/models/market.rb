class Market
  def initialize(options = {})
    @params = options.fetch(:params)
    @customers = options.fetch(:customers) { Customer.all }
  end

  def valid?
    date_valid? && invalid_customer_ids.empty? && new_transactions.all?(&:valid?)
  end

  def save!
    ActiveRecord::Base.transaction do
      new_transactions.each do |transaction|
        transaction.save!
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

  def invalid_customer_ids
    @invalid_customer_ids ||= @params[:transactions].map { |k,v| k } - @customers.map { |c| c.id.to_s }
  end

  def new_transactions
    @new_transactions ||= @params[:transactions].map { |k, v| build_transaction(k, v) }.compact
  end

  def build_transaction(customer_id, data)
    return nil if data[:amount].blank?
    customer = @customers.detect { |c| c.id.to_s == customer_id.to_s }
    customer.transactions.build do |transaction|
      transaction.occurred_on = @params[:date]
      transaction.amount = data[:amount]
      transaction.description = data[:description]
    end
  end
end
