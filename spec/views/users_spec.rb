require 'rails_helper'

RSpec.describe 'Testing Authentication' do
  describe 'adding a new user' do
    it 'creates a new user' do
      visit('/')
      click_link('Sign up')

      expect(current_path).to have_content('/users/new')

      fill_in('user[name]', with: 'user1003')
      click_button('Create User')

      expect(current_path).to have_content('/')
      expect(page).to have_content('Current Profile: user1003')
    end
  end
end
