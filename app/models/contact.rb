class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_addresses, dependent: :destroy, inverse_of: :contact
  has_many :contact_phone_numbers, dependent: :destroy

  accepts_nested_attributes_for :contact_addresses, allow_destroy: true,
                                reject_if: ->(attrs) { attrs['address_type'].blank? || attrs['address'].blank? }

  validates :name, presence: true, uniqueness: true
end
