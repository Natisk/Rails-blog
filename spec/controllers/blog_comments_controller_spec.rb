require 'spec_helper'

describe BlogCommentsController do
  before :each do
    @post = FactoryGirl.create(:post)
    @post.blog_comments.create(:body => 'nice comment')
  end

  it 'must create a comment' do
    BlogComment.should_not be_nil
  end

  it 'should get index' do
    get :show
    response.should be_success
  end

=begin
  it "should get show" do
    get :show, :id => @blog_comment
    assigns(:blog_comment).should eq(@blog_comment)
  end
=end
end