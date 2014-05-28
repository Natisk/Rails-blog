# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag_word   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base

  has_many :post_tags
  has_many :posts, :through => :post_tags

  attr_accessible :tag_word

  validates :tag_word, :length => {:maximum => 30}

end
