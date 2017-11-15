class ContactPhoneNumber < ApplicationRecord
  belongs_to :contact
  validates :phone_number, presence: true
end
