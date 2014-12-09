class Event < ActiveRecord::Base
  has_many :registrations, inverse_of: :event, dependent: :destroy
  has_many :users, -> { select 'users.*, registrations.status as status' }, :through => :registrations
  belongs_to :location
  validates :name, :start_time, :end_time, presence: true
  accepts_nested_attributes_for :location, allow_destroy: true
end
