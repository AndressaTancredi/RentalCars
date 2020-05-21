class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  has_one :car_rental
  
  validates :start_date, :end_date, presence: true
  enum status: { scheduled: 0, ongoing: 5 }

  before_create :generate_code

  private

  def generate_code
    # self pro RoR entender que não é uma var é uma atribuição
    # Loop para garantir que não aja código repetido
    self.code = loop do
      code = SecureRandom.alphanumeric(6).upcase
        break code unless Rental.exists?(code: code)
    end
    # TODO Fazer teste para verificar se gerou dois códigos diferentes Aula 14 58m
  end
end