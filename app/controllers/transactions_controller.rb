class TransactionsController < ApplicationController
  def index
    vm.from =
      case params[:from]
      when /-(\d+)m/
        $1.to_i.months.ago
      when /-(\d+)y/
        $1.to_i.years.ago
      when /(\d+)-(\d+)-(\d+)/
        Date.new($1.to_i, $2.to_i, $3.to_i)
      end
    if vm.from
      vm.transactions = Transaction.since(vm.from)
    else
      vm.transactions = Transaction.all
    end
  end

  def create
    customer = Customer.find(params[:customer_id])
    transaction = customer.transactions.new(params.require(:transaction).permit(:occurred_on, :description, :amount))
    audit! :action => :create, :customer => customer, :transaction => transaction
    unless transaction.save
      flash[:error] = transaction.errors.full_messages.join("\n")
    end
    redirect_to customer
  end

  def destroy
    customer = Customer.find(params[:customer_id])
    transaction = customer.transactions.find(params[:id])
    audit! :action => :destroy, :customer => customer, :transaction => transaction
    transaction.destroy
    redirect_to customer
  end

  private

  def audit!(data)
    Audit.audit!(current_user, data)
  end
end
