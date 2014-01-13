require 'spec_helper'

describe CustomerList::CustomerInList do
  subject { described_class.new(customer) }
  context 'with an empty customer' do
    let(:customer) { FactoryGirl.create :customer, :name => 'Polly Pirate' }
    it { expect(subject.name).to eq("Polly Pirate") }
    it { expect(subject.last_transaction).to be_blank }
    it { expect(subject.balance).to eq("$0.00") }
  end
  context 'with a new customer' do
    let(:customer) { FactoryGirl.create :customer }
    before do
      FactoryGirl.create :transaction, :customer => customer, :occurred_on => '2013-01-01', :amount => 100
    end
    it { expect(subject.last_transaction).to eq("signed up for $100.00 on 2013-01-01") }
    it { expect(subject.balance).to eq("$100.00") }
  end
  context 'with an active customer' do
    let(:customer) { FactoryGirl.create :customer }
    before do
      FactoryGirl.create :transaction, :customer => customer, :occurred_on => '2013-01-01', :amount => 100
      FactoryGirl.create :transaction, :customer => customer, :occurred_on => '2013-02-02', :amount => -20
    end
    it { expect(subject.last_transaction).to eq("spent $20.00 on 2013-02-02") }
    it { expect(subject.balance).to eq("$80.00") }
  end
end
