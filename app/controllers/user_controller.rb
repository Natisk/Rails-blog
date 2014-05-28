class UserController < ApplicationController
  
  before_filter :is_owner, :only => [:edit, :update, :destroy]

end
