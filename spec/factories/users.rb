FactoryBot.define do
  factory :user do
    username { 'prasanna' }
    email { 'prasanna@francium.tech' }

    trait :with_role do
      transient do
        role_name { 'viewer' }
      end

      before(:create) do |user, evaluator|
        user.role = create(:role, name: evaluator.role_name)
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

  factory :admin_user_with_articles, parent: :user do
    with_article
    association :role, factory: :role, name: 'admin'
  end
end
