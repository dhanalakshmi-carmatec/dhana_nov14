class ContactAddress < ApplicationRecord
  belongs_to :contact
    
  validates :address_type, presence: true  
  validates :address, presence: true
end
