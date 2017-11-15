class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_addresses, dependent: :destroy
  has_many :contact_phone_numbers, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
