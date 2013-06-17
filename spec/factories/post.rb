FactoryGirl.define do
  factory :post do
    association :user, :factory => :user
    sequence(:title) { |n| "john#{n}" }
    body 'h werhg jlerg agjhdsafj h;laskjgh;sdag hdfh'
  end

end