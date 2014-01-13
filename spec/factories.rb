FactoryGirl.define do
  factory :customer do
    sequence(:name) { |i| "Automaton #{i}" }
    sequence(:slug) { |i| "slug-#{i}" }
  end

  factory :transaction do
    occurred_on Date.today
    amount 10
    customer
  end
end
