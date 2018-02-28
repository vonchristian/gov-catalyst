module Taxpayers
  class TaxpayerSignUpsController < ApplicationController
    def new
      @sign_up = Taxpayers::SignUp.new
    end
    def create
      @sign_up = Taxpayers::SignUp.new(sign_up_params)
      if @sign_up.valid?
        @sign_up.save
        redirect_to "/", notice: "#{@sign_up.notice}"
      else
        render :new
      end
    end

    private
    def sign_up_params
      params.require(:taxpayers_sign_up).permit(:email, :password, :password_confirmation)
    end
  end
end
