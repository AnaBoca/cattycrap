class Event < ApplicationRecord
  belongs_to :user
  validates :vaccine_type, presence: true
end
