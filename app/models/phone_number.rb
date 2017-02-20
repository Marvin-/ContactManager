class PhoneNumber < ApplicationRecord
  belongs_to :person, optional: true

  validates :number, :person_id, presence: true
end
