# app/models/turkey.rb
class Turkey < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0.0 }
  validates :sex, presence: true, inclusion: { in: %w(male female) }
  validates :species, presence: true, inclusion: { in: ['Eastern Wild Turkey', 'Osceola Turkey', 'Rio Grande Turkey', 'Merriam\'s Turkey', 'Gould\'s Turkey', 'South Mexican Turkey', 'Ocellated Turkey'] }
  validates :status, presence: true, inclusion: { in: %w[wild semi-wild domesticated] }
end
