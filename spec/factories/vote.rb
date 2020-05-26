FactoryBot.define do
  factory :vote do
    user_id { create(:user).id }
    article_id { create(:article).id }
  end
end
