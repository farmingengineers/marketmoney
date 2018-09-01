require 'spec_helper'

describe CustomerList do
  subject { described_class.new(customers: customers) }
  context 'with several customers' do
    let(:customers) { [customer1, customer2] }
    let(:customer1) { FactoryBot.create :customer }
    let(:customer2) { FactoryBot.create :customer }
    before do
      FactoryBot.create :transaction, :customer => customer1, :occurred_on => '2013-01-01', :amount => 100
      FactoryBot.create :transaction, :customer => customer1, :occurred_on => '2013-02-02', :amount => -20
      FactoryBot.create :transaction, :customer => customer1, :occurred_on => '2013-01-01', :amount => 10
      FactoryBot.create :transaction, :customer => customer1, :occurred_on => '2013-02-02', :amount => -2
    end
    it { expect(subject.aggregate_balance).to eq(88) }
  end
end

describe CustomerList::CustomerInList do
  subject { described_class.new(customer) }
  context 'with an empty customer' do
    let(:customer) { FactoryBot.create :customer, :name => 'Polly Pirate' }
    it { expect(subject.name).to eq("Polly Pirate") }
    it { expect(subject.last_transaction).to be_blank }
    it { expect(subject.balance).to eq("$0.00") }
  end
  context 'with a new customer' do
    let(:customer) { FactoryBot.create :customer }
    before do
      FactoryBot.create :transaction, :customer => customer, :occurred_on => '2013-01-01', :amount => 100
    end
    it { expect(subject.last_transaction).to eq("signed up for $100.00 on 2013-01-01") }
    it { expect(subject.balance).to eq("$100.00") }
  end
  context 'with an active customer' do
    let(:customer) { FactoryBot.create :customer }
    before do
      FactoryBot.create :transaction, :customer => customer, :occurred_on => '2013-01-01', :amount => 100
      FactoryBot.create :transaction, :customer => customer, :occurred_on => '2013-02-02', :amount => -20
    end
    it { expect(subject.last_transaction).to eq("spent $20.00 on 2013-02-02") }
    it { expect(subject.balance).to eq("$80.00") }
  end
end
