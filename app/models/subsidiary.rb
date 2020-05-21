class Subsidiary < ApplicationRecord
  validates :cnpj, :name, :address, presence: true
  validates :cnpj, :name, :address, uniqueness: true

  validate :valid_cnpj

  def valid_cnpj
    return if cnpj.nil? 
    # Ou poderia usar o length direto no validate:
    # validates: :cnpj, length: { minimum: 14 }
    unless cnpj.length == 14
      errors.add(:cnpj, 'deve ter 14 números')
    end
    # Se o CNPJ NÃO é válido, add o erro, posso usar o ! ou unless
    unless CNPJ.valid?(cnpj)
      errors.add(:cnpj, 'não é válido')
    end
  end
end