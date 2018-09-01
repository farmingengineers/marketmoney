class CustomersController < ApplicationController
  def index
    vm.customers = CustomerList.new
  end

  def edit_all
    vm.customers = CustomerList.new(hide_zeroes: true)
  end

  def update_all
    market_params = params.require(:market).permit(:date, :transactions => {}).to_h
    market = Market.new :params => market_params, :current_user => current_user
    if market.valid?
      market.save!
      redirect_to :action => 'index'
    else
      vm.customers = CustomerList.new(hide_zeroes: true)
      render :action => 'edit_all', :locals => { :vm => vm }
    end
  end

  def show
    vm.customer = Customer.find(params[:id])
    vm.transaction_summary = TransactionList.new(vm.customer)
    vm.new_transaction = Transaction.new(:occurred_on => Time.now, :amount => 0)
  end

  def new
    vm.customer = Customer.new
  end

  def create
    persist(Customer.new, 'new')
  end

  def edit
    vm.customer = Customer.find(params[:id])
  end

  def update
    persist(Customer.find(params[:id]), 'edit')
  end

  private

  def persist(customer, form_action)
    customer.attributes = params.require(:customer).permit(:name, :notes)
    customer.slug_me
    customer.save!
    redirect_to :action => 'index'
  rescue
    vm.customer = customer
    render :action => form_action
  end
end
