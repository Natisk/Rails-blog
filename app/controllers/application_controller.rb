class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_owner?
    current_user.id == params[:id]
  end

end
