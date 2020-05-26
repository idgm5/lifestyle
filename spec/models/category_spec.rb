require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Validations for Category' do
    let(:category) { FactoryBot.create :category }

    it 'should be valid' do
      expect(category).to be_valid
    end

    it 'should be present' do
      expect(category).to be_present
    end

    it 'should not be spaces for name' do
      category.name = '   '
      expect(category).to_not be_valid
    end

    it 'should not be valid if priority is not an integer' do
      category.priority = nil
      expect(category).to_not be_valid
    end
  end

  context 'Associations with category table' do
    it 'has many articles' do
      assc = Category.reflect_on_association(:articles)
      expect(assc.macro).to eq :has_many
    end
  end
end
