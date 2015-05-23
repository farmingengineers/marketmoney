require 'spec_helper'

describe Market do
  subject(:market) { Market.new(:params => params.with_indifferent_access, :customers => customers, :current_user => current_user) }
  let(:params) { {} } # contents of `params[:market]` from a customers#update_all request.
  let(:customers) { Customer.all }
  let(:current_user) { FactoryGirl.create :admin }

  context 'with no date' do
    it { expect(market).not_to be_valid }
  end

  context 'with invalid date' do
    let(:params) { { :date => '2014-13-13' } }
    it { expect(market).not_to be_valid }
  end

  context 'with date' do
    let(:params) { { :date => '2014-02-02', :transactions => transaction_params } }
    let!(:customer) { FactoryGirl.create :customer }

    context 'and no customer data' do
      let(:transaction_params) { {} }
      it { expect(market).to be_valid }
      it { expect { market.save! }.not_to change { Customer.count } }
      it { expect { market.save! }.not_to change { Transaction.count } }
    end

    context 'and data for a customer that does not exist' do
      let(:transaction_params) { { (customer.id + 1).to_s => { :amount => '1.00', :description => 'anything' } } }
      it { expect(market).not_to be_valid }
    end

    context do
      let(:transaction_params) { { customer.id.to_s => { :amount => amount, :description => description } } }
      let(:description) { '' }

      context 'and blank amount' do
        let(:amount) { '' }
        it { expect(market).to be_valid }
        it { expect { market.save! }.not_to change { Customer.count } }
        it { expect { market.save! }.not_to change { Transaction.count } }
      end

      context 'and invalid amount' do
        let(:amount) { '1.2.3' }
        it { expect(market).not_to be_valid }
      end

      context 'and valid amount' do
        let(:amount) { "2.00" }
        it { expect(market).to be_valid }
        it { expect { market.save! }.not_to change { Customer.count } }
        it { expect { market.save! }.to change { Transaction.count }.by(1) }
        context do
          before { market.save! }
          let(:new_transaction) { Transaction.last }
          it { expect(new_transaction.customer).to eq(customer) }
          it { expect(new_transaction.occurred_on).to eq(Date.parse('2014-02-02')) }
          it { expect(new_transaction.amount).to eq(-2) }
          it { expect(new_transaction.description).to be_blank }
          context 'and description' do
            let(:description) { 'tomatoes' }
            it { expect(new_transaction.description).to eq('tomatoes') }
          end
        end
      end
    end
  end
end
