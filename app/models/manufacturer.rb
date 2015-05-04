class Manufacturer < ActiveRecord::Base
  has_many :cars
  validates :name, presence: true
  validates :country_name, presence: true
end
