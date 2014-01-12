class CustomersController < ApplicationController
  def index
    vm.customers = Customer.all
  end

  private

  helper_method :vm
  def vm
    @vm ||= OpenStruct.new
  end
end
