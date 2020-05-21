# A Factory costuma ter o nome da model no plural

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com.br"} # Para ter um email para cada teste usa sequence
    password { '12345678' }
  end
end