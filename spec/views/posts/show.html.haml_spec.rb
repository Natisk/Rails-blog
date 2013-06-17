require 'spec_helper'

describe 'posts/show' do
  before :each do
    @user = FactoryGirl.create :user
    @post = FactoryGirl.create :post
    @post.tags.create(tag_word: 'css')
  end

=begin
  it 'should have content List' do
    assign(:tag, stub_model(Tag, tag_word: 'slicer'))
    render
    response.should contain('slicer')
  end
=end
end