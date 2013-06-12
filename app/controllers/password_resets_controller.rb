class PasswordResetsController < ApplicationController
  def new
  end

  def create
    redirect_to root_url, :notice => "Email has been sent to your address"
  end
end
