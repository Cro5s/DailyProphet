FactoryBot.define do
  factory :response do
    body { "MyString" }
    author_id { 1 }
    story_id { 1 }
  end
end
