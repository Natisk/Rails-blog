require 'spec_helper'

describe UserController do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  context "valid attributes" do

    it "should have a current_user" do
      # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
      User.should_not be_nil
    end

    it "located the requested @user" do
      put :update, :id => @user, :user => FactoryGirl.attributes_for(:user)
      assigns(:user).should eq(@user)
    end

    it "located the requested @user" do
      put :update, :id => @user, :user => FactoryGirl.attributes_for(:user)
      assigns(:user).should eq(@user)
    end

  end

=begin
  it "should get index" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end
=end
end