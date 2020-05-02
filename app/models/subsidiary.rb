class Subsidiary < ApplicationRecord
  validates :cnpj, :name, :address, presence: true
  validates :cnpj, :name, :address, uniqueness: true

  validate :valid_cnpj
  def valid_cnpj
    if cnpj.nil?
      return
    end
    # Ou poderia usar o length direto no validate:
    # validates: :cnpj, length: { minimum: 14 }
    if cnpj.length != 14
      errors.add(:cnpj, 'deve ter 14 números')
    end

    # Se o CNPJ NÃO é válido, add o erro, posso usar o ! ou unless
    if !CNPJ.valid?(cnpj)
      errors.add(:cnpj, 'não é válido')
    end
  end
end