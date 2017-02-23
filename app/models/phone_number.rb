class PhoneNumber < ApplicationRecord
  belongs_to :contact, optional: true, polymorphic: true

  validates :number, :contact_id, presence: true
end
