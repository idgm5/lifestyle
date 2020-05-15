require 'rails_helper'

RSpec.describe 'Articles Management' do

  describe 'add a new article' do
    before do
     Category.create(name:"testing", priority: 2)
    end

    it 'creates a new user and generates a new article' do
      visit('/')
      click_link('Sign up')

      expect(current_path).to have_content('/users/new')

      fill_in('user[name]', with: 'user1004')
      click_button('Create User')

      expect(current_path).to have_content('/')

      click_link('New Article')

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

  describe 'updates an article' do
    before do
     Category.create(name:"testing", priority: 2)
    end

    it 'updates a recent created article' do
      visit('/')
      click_link('Sign up')

      expect(current_path).to have_content('/users/new')

      fill_in('user[name]', with: 'user1004')
      click_button('Create User')

      expect(current_path).to have_content('/')

      click_link('New Article')

      expect(current_path).to have_content('/articles/new')

      fill_in('article[title]', with: 'E3 Conference')
      fill_in('article[text]', with: 'California best state to live')
      find('form input[type="file"]').set('./spec/photos/cat.jpg')
      within '#article_category_id' do
        find("option[value='1']").click
      end

      click_button('Create Article')

      expect(page).to have_content('E3 Conference')

      click_link('Edit')

      fill_in('article[title]', with: 'Rubykaigi 2020')
      fill_in('article[text]', with: 'At tokyo japan')
      find('form input[type="file"]').set('./spec/photos/cat.jpg')
      within '#article_category_id' do
        find("option[value='1']").click
      end
      click_button('Update Article')

      expect(page).to have_content('Rubykaigi 2020')
    end
  end
end
