require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations for user' do
    fixtures :users
    before :each do
      @user = users(:first)
      @user_new = User.create(name: 'User1001')
    end

    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should be present' do
      expect(@user_new).to be_present
    end

    it 'name should not be spaces' do
      @user.name = '   '
      expect(@user).to_not be_valid
    end
  end

  context 'Associations with user table' do
    it 'has many articles' do
      assc = User.reflect_on_association(:articles)
      expect(assc.macro).to eq :has_many
    end

    it 'has many votes' do
      assc = User.reflect_on_association(:votes)
      expect(assc.macro).to eq :has_many
    end
  end
end
