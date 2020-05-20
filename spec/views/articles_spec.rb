require 'rails_helper'

RSpec.describe 'Articles Management' do
  describe 'add a new article' do
    before do
      Category.create(name: 'testing', priority: 2)
    end

    it 'creates a new user and generates a new article' do
      visit('/')
      click_link('REGISTER')

      expect(current_path).to have_content('/users/new')

      fill_in('user[name]', with: 'user1003')
      click_button('Create Account')

      expect(current_path).to have_content('/')

      click_link('Write an Article')

      expect(current_path).to have_content('/articles/new')

      fill_in('article[title]', with: 'E3 Conference')
      fill_in('article[text]', with: 'California best state to live')
      find('form input[type="file"]').set('./spec/photos/cat.jpg')
      within '#article_category_id' do
        find("option[value='1']").click
      end
      click_button('Create Article')

      expect(page).to have_content('E3 Conference')
    end
  end
end
