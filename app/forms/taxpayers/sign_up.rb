module Taxpayers
  class SignUp
    include ActiveModel::Model
     attr_accessor :email, :password, :password_confirmation
     validates :email,  presence: true
    def save
      ActiveRecord::Base.transaction do
        create_sign_up
      end
    end
    def notice
      if find_taxpayer.confirmed?
        "You are already registered"
      else
        "Please confirm your email"
      end
    end

    private
    def create_sign_up
      taxpayer = Taxpayer.find_or_create_by(email: email)
      unless taxpayer.confirmed?
        taxpayer.send_confirmation_instructions
      end
    end
    def find_taxpayer
      Taxpayer.find_by(email: email)
    end
  end
end
