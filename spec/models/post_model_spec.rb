require 'spec_helper'

describe Post do
  before (:each) do
    3.times do
      FactoryGirl.create(:post, :status => true)
    end
    FactoryGirl.create(:post, :title => 'hidden post', :status => false)
  end
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user_id) }
  it { should have_many(:blog_comments).dependent(:destroy) }
  it { should have_many(:tags).through(:post_tags) }
  it { should have_many(:post_tags) }
  it { should allow_mass_assignment_of(:body) } # Attr_accessible check
  it { should allow_mass_assignment_of(:data) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:status) }
  it { should allow_mass_assignment_of(:explanation) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:tags_attributes) }
  it { should accept_nested_attributes_for(:tags) }
  it { should respond_to(:tags_attributes) }  # Attr_accessor check

  context 'must create posts' do

    it 'should be not hidden' do
      Post.nothidden.count.should == 3
    end

    it 'should be unapproved' do
      Post.unapproved.count.should == 1
    end

  end
end