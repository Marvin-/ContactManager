class EmailAddress < ApplicationRecord
  belongs_to :person, optional: true

  validates :address, :person_id, presence: true
end
