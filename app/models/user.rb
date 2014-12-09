class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registrations, inverse_of: :user, dependent: :destroy
  has_many :events, -> { select 'events.*, registrations.status as status' }, :through => :registrations
  validates :name, presence: true
end
