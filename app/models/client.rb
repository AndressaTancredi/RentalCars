class Client < ApplicationRecord
  validates :name, :document, :email, presence: true
  validates :document, :email, uniqueness: true
  validate :valid_document

  def formatted_document
    CPF.new(self.document).formatted
  end

  def identification
    "#{name} - #{formatted_document}"
  end

  def valid_document
    return if document.nil? # guard clause

    unless document.length == 11
      errors.add(:document, 'deve ter 11 números')
    end

    unless CPF.valid?(document)
      errors.add(:document, 'não é válido')
    end
  end
end