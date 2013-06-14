FactoryGirl.define do
  factory :blog_comment do
    association :user, :factory => :user
    association :post, :factory => :post
    body 'h werhg jlerg agjhdsafj h;laskjgh;sdag hdfh'
  end

end