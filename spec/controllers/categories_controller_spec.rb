require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:article) { FactoryBot.create :article }

  describe '#vote' do
    it 'adds a vote object to votes' do
      expect { put :vote, params: { user_id: user, article_id: article } }.to change(Vote, :count).by(1)
    end
  end

  describe '#unvote' do
    it 'deletes a vote object from votes' do
      put :vote, params: { user_id: user, article_id: article }
      expect { put :unvote, params: { user_id: user, article_id: article } }.to change(Vote, :count).by(-1)
    end
  end
end
