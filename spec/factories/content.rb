FactoryBot.define do
  factory :content, class: PostItem do
    sequence(:content) { |n| "リスト#{n}"}
    sequence(:status) { false }  
  end
end