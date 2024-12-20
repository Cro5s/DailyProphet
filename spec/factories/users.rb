FactoryBot.define do
  factory :user do
    username { "MyString" }
    name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    session_token { "MyString" }
  end
end
