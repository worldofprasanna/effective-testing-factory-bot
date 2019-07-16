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
  end
end
