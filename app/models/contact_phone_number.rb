class ContactPhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :phone_type, presence: true
  validates :phone_number, presence: true, numericality: true,
                 length: { :minimum => 10, :maximum => 15 }
end
