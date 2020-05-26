require 'rails_helper'

RSpec.describe VotesController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:article) { FactoryBot.create :article }

  describe '#vote' do
    it 'adds a vote object to votes' do
      expect { put :create, params: { user_id: user, article_id: article } }.to change(Vote, :count).by(1)
    end
  end

  describe '#unvote' do
    it 'deletes a vote object from votes' do
      put :create, params: { user_id: user, article_id: article }
      expect { put :destroy, params: { user_id: user, article_id: article } }.to change(Vote, :count).by(-1)
    end
  end
end
