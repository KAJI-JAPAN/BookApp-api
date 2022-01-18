FactoryBot.define do
  factory :book, class: Post do
    sequence(:id) { |n| n}
    sequence(:title) { |n| "本のタイトル#{n}" }
    sequence(:author) { |n| "著者名#{n}" }
    sequence(:image) { |n| "本の画像#{n}"}
  end

  factory :register, class: PostItem do
    
  end
end