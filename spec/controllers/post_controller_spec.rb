require 'spec_helper'

describe PostsController do

  context 'index show' do

    before :each do
      @post = FactoryGirl.create(:post)
    end

    it "should have a current_user" do
      Post.should_not be_nil
    end

    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "should get show" do
      get :show, :id => @post
      assigns(:post).should eq(@post)
    end

    it "should render show template" do
      get :show, :id => @post
      response.should render_template :post
    end

    it "assigns form params[:post] to the new post" do #if user not signed in
      post = FactoryGirl.create(:post)
      get :new
      assigns(:post).should be_nil
    end

=begin
    it "creates a new user" do
      expect{
        post :create, :user => FactoryGirl.attributes_for(:user)
      }.to change(User,:count).by(1)
    end
=end

    it "redirects to the sign_in" do
      post :create, user: FactoryGirl.attributes_for(:user)
      response.should redirect_to '/users/sign_in'
    end

=begin
    it "re-renders the new method" do
      post :create, user: FactoryGirl.attributes_for(:invalid_user)
      response.should render_template :new
    end
=end
  end


end