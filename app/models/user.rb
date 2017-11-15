class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contacts, dependent: :destroy

  validates :name, :email, presence: true, uniqueness: true 
  #validates :password, confirmation: true     
end
