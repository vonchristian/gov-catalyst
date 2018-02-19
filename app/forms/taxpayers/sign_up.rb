module Taxpayers
  class SignUp
    include ActiveModel::Model
     attr_accessor :email, :password, :password_confirmation
     validates :email, :password, :password_confirmation, presence: true
    def save
      ActiveRecord::Base.transaction do
        create_sign_up
      end
    end

    private
    def create_sign_up
      email = Taxpayer.create(email: email)
      send_confirmation_email(email)
    end
    def send_confirmation_email(email)
      ConfirmationEmailJob.new(email).deliver_later
    end
  end
end
