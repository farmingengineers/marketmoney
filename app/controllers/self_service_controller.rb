class SelfServiceController < ApplicationController
  layout false

  def show
    vm.customer = Customer.where(:slug => params[:slug]).first!
    vm.transaction_summary = TransactionList.new(vm.customer)
  end

  protected

  def admin_required?
    false
  end
end
