class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  validates :start_date, :end_date, presence: true

  before_create :generate_code

  private

  # TODO Porque aqui e não no controller?
  def generate_code
    # self pro RoR entender que não é uma var é uma atribuição
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
