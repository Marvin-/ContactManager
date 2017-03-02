class Company < ApplicationRecord
  has_many :phone_numbers, as: :contact
  has_many :email_addresses, as: :contact
  belongs_to :user, optional: true

  validates :name, presence: true

  def to_s
    "#{name}"
  end
end
