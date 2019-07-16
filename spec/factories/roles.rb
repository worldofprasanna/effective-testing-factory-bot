FactoryBot.define do
  factory :role do
    name { 'viewer' }
    initialize_with { Role.find_or_create_by(name: name) }
  end
end
