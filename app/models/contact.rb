class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_addresses, dependent: :destroy, inverse_of: :contact
  has_many :contact_phone_numbers, dependent: :destroy, inverse_of: :contact

  accepts_nested_attributes_for :contact_addresses, allow_destroy: true,
                                reject_if: ->(attrs) { attrs['address_type'].blank? || attrs['address'].blank? }
 
  accepts_nested_attributes_for :contact_phone_numbers, allow_destroy: true,
                                reject_if: ->(attrs) { attrs['phone_type'].blank? || attrs['phone_number'].blank? }
  validates :name, presence: true, uniqueness: true
end
