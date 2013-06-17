require 'spec_helper'

describe 'posts/index' do
  before :each do
    @user = FactoryGirl.create :user
    @post = FactoryGirl.create :post
    @post.tags.create(:tag_word => 'css')
    #@tag = FactoryGirl.create :tag
  end

  it 'displays all the posts' do
    assign(:posts, [
        stub_model(Post, :title => 'slicer', :body => 'hey man'),
        stub_model(Post, :title => 'dicer', :body => 'hi man')
    ])

    render

    rendered.should contain('slicer', 'hey man')
    rendered.should contain('dicer', 'hi man')
  end

end