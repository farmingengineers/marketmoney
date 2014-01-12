class CustomersController < ApplicationController
  def index
    vm.customers = Customer.all
  end

  def show
    vm.customer = Customer.find(params[:id])
    vm.transaction_summary = TransactionList.new(vm.customer)
  end

  def new
    vm.customer = Customer.new
  end

  def create
    customer = Customer.new
    customer.name = params[:customer][:name]
    customer.notes = params[:customer][:notes]
    customer.save!
    redirect_to :action => 'index'
  rescue
    vm.customer = customer
    render :action => 'new'
  end

  private

  helper_method :vm
  def vm
    @vm ||= OpenStruct.new
  end
end
