FactoryBot.define do
  factory :book, class: Post do
    sequence(:title) { |n| "本のタイトル#{n}" }
    sequence(:author) { |n| "著者名#{n}" }
    sequence(:image) { |n| "本の画像#{n}"}
  end
end