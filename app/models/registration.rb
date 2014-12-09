class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :status, :user, :event, presence: true
end
