require 'spec_helper'

describe PostsController do

  context 'index show' do

    before :each do
      @post = FactoryGirl.create :post
    end

    it 'should have a current_user' do
      Post.should_not be_nil
    end

    it 'should get index' do
      get :index
      response.should be_success
    end

    it 'should get show' do
      get :show, :id => @post
      assigns(:post).should eq(@post)
    end

    it 'should render show template' do
      get :show, :id => @post
      response.should render_template :post
    end

    it 'assigns form params[:post] to the new post' do #if user not signed in
      post = FactoryGirl.create(:post)
      get :new
      assigns(:post).should be_nil
    end

    it 'should redirect to login user' do
      post :create, :post => FactoryGirl.attributes_for(:post)
      response.should redirect_to new_user_session_path
    end

=begin
    it "creates a new user" do
      expect{
        post :create, :user => FactoryGirl.attributes_for(:user)
      }.to change(User,:count).by(1)
    end
=end

    it 'redirects to the sign_in' do
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

  context '3 posts - no more' do
    before :each do
      @user = FactoryGirl.create :user
    end

    it 'should redirect to login user' do
      sign_in @user
      post :create, :post => FactoryGirl.attributes_for(:post)
      post = Post.last
      response.should redirect_to post_path(post)
    end

    it 'can be only 3 unapproved posts' do
      sign_in @user
      @user.posts.create(:title => 'new post1', :body => 'qwert asdf zxcv', :status => false)
      @user.posts.create(:title => 'new post2', :body => 'qwert asdf zxcv', :status => false)
      @user.posts.create(:title => 'new post3', :body => 'qwert asdf zxcv', :status => false)
      post :create, post: FactoryGirl.attributes_for(:post)
      response.should redirect_to posts_path
    end
  end


end