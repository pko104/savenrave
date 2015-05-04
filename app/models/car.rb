class Car < ActiveRecord::Base
  belongs_to :manufacturer
  validates :color, presence: true
  validates :mileage, presence: true
  validates :year, :numericality => { :greater_than_or_equal_to => 1920, :less_than_or_equal_to => 2014}

end
