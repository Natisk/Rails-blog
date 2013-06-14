require 'spec_helper'

describe User do

  before :each do
    2.times do
      FactoryGirl.create(:user)
    end
    FactoryGirl.create(:user)
  end

  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:blog_comments).dependent(:destroy) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:username) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
  it { should allow_mass_assignment_of(:remember_me) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(8) }

  context 'creating a user' do

    it "should be equal" do
      User.all.length.should be == 3
    end

  end

end