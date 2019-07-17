require 'rails_helper'

RSpec.describe User, type: :model do
  context 'user creation' do
    it 'should check if the user is created' do
      viewer = FactoryBot.create(:user)
      admin_user = FactoryBot.create(:user, role_name: 'admin')

      expect(viewer).not_to be_nil
      expect(viewer.role.name).to eq('viewer')

      expect(admin_user).not_to be_nil
      expect(admin_user.role.name).to eq('admin')
    end

    it 'should create user with Microsoft company as the client' do
      user = FactoryBot.create(:user, :with_client, client_name: 'Microsoft')

      expect(user.client.name).to eq('Microsoft')
    end

    it 'should create admin user with 5 articles and with ABC Company as client' do
      admin_user_with_articles = FactoryBot.create(:admin_user_with_articles_with_client, role_name: 'admin')

      expect(admin_user_with_articles).not_to be_nil
      expect(admin_user_with_articles.role.name).to eq('admin')
      expect(admin_user_with_articles.articles.count).to eq(5)
      expect(admin_user_with_articles.client.name).to eq('ABC Company')
    end
  end

  context 'article creation' do
    it 'should create the user along with 5 articles by default' do
      viewer = FactoryBot.build(:user, :with_article)

      expect(viewer.articles.count).to eq(5)
    end

    it 'should create the user along with the articles given' do
      viewer = FactoryBot.build(:user, :with_article, no_of_articles: 10)

      expect(viewer.articles.count).to eq(10)
    end
  end
end
