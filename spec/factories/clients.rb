FactoryBot.define do
  factory :client do
    name { 'Fulano Sicrano' }
    document { CPF.generate }
    sequence(:email) { |n| "email#{n}@email.com" }
  end
end