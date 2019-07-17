FactoryBot.define do
  factory :user do
    username { 'prasanna' }
    email { 'prasanna@francium.tech' }

    transient do
      role_name { 'viewer' }
    end

    before(:create) do |user, evaluator|
      user.role = create(:role, name: evaluator.role_name)
    end

    trait :with_client do
      transient do
        client_name { 'ABC Company' }
      end

      before(:create) do |user, evaluator|
        user.client = create(:client, name: evaluator.client_name)
      end
    end

    trait :with_article do
      transient do
        no_of_articles { 5 }
      end

      after(:build) do |user, evaluator|
        user.articles = create_list(:article, evaluator.no_of_articles, user: user)
      end
    end
  end

  factory :admin_user_with_articles_with_client, parent: :user do
    with_article
    with_client
  end
end
