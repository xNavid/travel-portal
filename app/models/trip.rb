class Trip < ActiveRecord::Base
  belongs_to :user
  belongs_to :manager
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 250 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :travel_mode, presence: true, length: { minimum: 3, maximum: 50 }
  validates :ticket_cost, presence: true
  validates :user_id, presence: true
end