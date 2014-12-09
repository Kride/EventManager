class Location < ActiveRecord::Base
  has_many :events, inverse_of: :location, dependent: :destroy
  validates :name, :address, presence: true
end
