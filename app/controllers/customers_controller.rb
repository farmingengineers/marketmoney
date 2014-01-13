class CustomersController < ApplicationController
  def index
    vm.customers = CustomerList.new
  end

  def edit_all
    vm.customers = CustomerList.new
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
    customer.name = params[:customer][:name]
    customer.notes = params[:customer][:notes]
    customer.save!
    redirect_to :action => 'index'
  rescue
    vm.customer = customer
    render :action => form_action
  end

  helper_method :vm
  def vm
    @vm ||= OpenStruct.new
  end
end
