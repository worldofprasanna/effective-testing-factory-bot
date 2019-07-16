require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should check if the user is created' do
    viewer = FactoryBot.create(:user)
    admin_user = FactoryBot.create(:user, role_name: 'admin')

    expect(viewer).not_to be_nil
    expect(viewer.role.name).to eq('viewer')

    expect(admin_user).not_to be_nil
    expect(admin_user.role.name).to eq('admin')
  end
end
