require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validating Article' do
    let(:article) { FactoryBot.create :article }

    it 'should be valid' do
      expect(article).to be_valid
    end

    it 'should be present' do
      expect(article).to be_present
    end

    it 'should not be spaces for title' do
      article.title = '   '
      expect(article).to_not be_valid
    end
    
    it 'should not be valid if text is blank' do
      article.text = '   '
      expect(article).to_not be_valid
    end

    it 'should not be valid if author is not present' do
      article.author_id = nil
      expect(article).to_not be_valid
    end

    it 'should not be valid if image is not present' do
      article.image = nil
      expect(article).to_not be_valid
    end

    it 'should not be valid if category_id is not present' do
      article.category_id = nil
      expect(article).to_not be_valid
    end
  end

  context 'Associations with article table' do
    it 'belongs to author' do
      assc = Article.reflect_on_association(:author)
      expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to category' do
      assc = Article.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has many votes' do
      assc = Article.reflect_on_association(:votes)
      expect(assc.macro).to eq :has_many
    end
  end
end
