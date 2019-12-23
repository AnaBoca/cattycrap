class Event < ApplicationRecord
  belongs_to :user
  validates :vaccine_type, :date, :notes, length: { minimum: 2, maximum: 50 }, presence: true
end
