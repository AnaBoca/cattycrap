class Event < ApplicationRecord
  belongs_to :user
  validates :vaccine_type, :date, :notes, presence: true
  validates :notes, length: { minimum: 2, maximum: 200 }
end
