class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :bids
end
