class Price < ApplicationRecord
  validates :time, presence: true
  validates :value, presence: true, numericality: {only_float: true}
  validates :date, presence: true
end
