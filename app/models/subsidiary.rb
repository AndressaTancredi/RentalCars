class Subsidiary < ApplicationRecord
  validates :cnpj, presence: true,
                   uniqueness: true
end
