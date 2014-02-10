class CustomersController < ApplicationController
  def index
    vm.customers = CustomerList.new
  end

  def edit_all
    vm.customers = CustomerList.new
  end

  def update_all
    market = Market.new :params => params[:market]
    if market.valid?
      market.save!
      redirect_to :action => 'index'
    else
      render :action => 'edit', :locals => { :vm => model }
    end
  end

  def show
    vm.customer = Customer.find(params[:id])
    vm.transaction_summary = TransactionList.new(vm.customer)
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
    customer.save!
    redirect_to :action => 'index'
  rescue
    vm.customer = customer
    render :action => form_action
  end
end
