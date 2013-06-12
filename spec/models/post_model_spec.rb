require 'spec_helper'

describe Post do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should have_many(:blog_comments), :dependent => :destroy }
  it { should have_many(:tags), :through => :post_tags }
  it { should have_many(:post_tags) }
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:data) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:status) }
  it { should allow_mass_assignment_of(:explanation) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:tags_attributes) }
  it { should accept_nested_attributes_for(:tags) }


  #it 'should have writer and reader methods defined' do
  #  Post.should have_accessor(:tags_attributes)
  #end


end