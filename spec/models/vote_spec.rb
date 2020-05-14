require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'Validations for Vote' do
    let(:vote) { FactoryBot.create :vote }

    it 'should be valid' do
      expect(vote).to be_valid
    end

    it 'should be present' do
      expect(vote).to be_present
    end

    it 'should not be valid if user_id is not present' do
      vote.user_id = nil
      expect(vote).to_not be_valid
    end

    it 'should not be valid if article_id is not present' do
      vote.article_id = nil
      expect(vote).to_not be_valid
    end
  end

  context 'Associations with vote table' do
    it 'belongs to user' do
      assc = Vote.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to article' do
      assc = Vote.reflect_on_association(:article)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
