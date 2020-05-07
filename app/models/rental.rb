class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  validates :start_date, :end_date, presence: true
  enum status: { scheduled: 0, ongoing: 5 }

  before_create :set_scheduled
  before_create :generate_code

  private

  def generate_code
    # self pro RoR entender que não é uma var é uma atribuição
    self.code = SecureRandom.alphanumeric(6).upcase
  end

  def set_scheduled
    self.status = 'scheduled'
  end
end