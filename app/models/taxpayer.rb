class Taxpayer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :business_ownerships, class_name: "Businesses::BusinessOwnership", as: :owner
  has_many :businesses, through: :business_ownerships, as: :owner
end
