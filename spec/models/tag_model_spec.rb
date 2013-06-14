require 'spec_helper'

describe Tag do

  it { should have_many(:posts).through(:post_tags) }
  it { should have_many(:post_tags) }
  it { should allow_mass_assignment_of(:tag_word) }

end