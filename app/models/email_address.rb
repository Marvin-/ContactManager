class EmailAddress < ApplicationRecord
  belongs_to :contact, optional: true, polymorphic: true

  validates :address, :contact_id, presence: true
end
