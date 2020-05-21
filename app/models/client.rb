class Client < ApplicationRecord
  validates :name, :document, :email, presence: true
  validates :document, :email, uniqueness: true
  validate :valid_cpf
  has_many :rentals

  def formatted_document
    CPF.new(self.document).formatted
  end

  def valid_cpf
    return if document.nil?

    unless document.length == 11
      errors.add(:document, 'deve ter 11 números')
    end

    unless CPF.valid?(document)
      errors.add(:document, 'não é válido')
    end
  end
end