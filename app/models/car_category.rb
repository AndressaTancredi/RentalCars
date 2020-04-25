class CarCategory < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: true
  validates :daily_rate, numericality: { greater_than: 0 }, allow_nil: true
  validates :car_insurance, numericality: { greater_than: 0 }, allow_nil: true
  validates :third_part_insurance, numericality: { greater_than: 0 }, allow_nil: true

end
