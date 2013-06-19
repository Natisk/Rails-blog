require 'spec_helper'

describe BlogComment do
  before (:each) do
    FactoryGirl.create(:blog_comment)
  end

  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:user) }
  it { should allow_mass_assignment_of(:post_id) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:commenter) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_most(1024) }

  context 'must create blog_comments' do

    it 'comment should be added' do
      BlogComment.count.should == 1
    end

  end
end