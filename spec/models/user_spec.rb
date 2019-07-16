require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should check if the user is created' do
    user = FactoryBot.create(:user)
    expect(user).not_to be_nil
  end
end
