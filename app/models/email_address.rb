class EmailAddress < ApplicationRecord
  belongs_to :person, optional: true

  validates :address, presence: true
end
