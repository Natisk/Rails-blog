require 'spec_helper'

include Warden::Test::Helpers

describe 'user log in process', :js => true do

  context 'checking user log in process' do

    it 'should log in' do
      FactoryGirl.create(:user, :email => 'asdf1@mail.ru', :password => '12345678')
      visit '/'
      click_link 'Log in'
      within('#new_user') do
        fill_in 'Email', :with => 'asdf1@mail.ru'
        fill_in 'Password', :with => '12345678'
      end
      click_button 'Log in'
      page.should have_content('Signed in successfully.')
    end

  end

  context 'log in user and making a post' do

    before :each do
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)
    end

    it 'should create a post' do
      visit '/'
      click_link 'New Post'
      within('#new_post') do
        fill_in 'Title', :with => 'New post creation'
        fill_in 'Body', :with => 'Body of my new post'
        find(:xpath, "//input[@id='post_tags_attributes_0_tag_word']").set 'css'
      end
      click_button 'Create Post'
      page.should have_content('Post was successfully created')
      click_link 'Edit'
      within('.edit_post') do
        fill_in 'Title', with: 'New post creation 1'
      end
      click_button 'Update Post'
      page.should have_content('Post was successfully updated')
      within('#new_blog_comment') do
        fill_in 'Body', :with => 'Nice post'
      end
      click_button 'Create blog_comment'
      page.should have_content('Commenter', 'Nice post', 'css')
      click_link 'Edit comment'
      within('.edit_blog_comment') do
        fill_in 'Body', with: 'Nice post 1'
      end
      click_button 'Create blog_comment'
      page.should have_content('Comment was successfully updated')
      click_link 'Edit profile'
      within('#edit_user') do
        fill_in 'Username', with: 'Vasek'
        fill_in 'Current password', with: '12345678'
      end
      click_button 'Update'
      page.should have_content('You updated your account successfully')
      click_link 'Edit profile'
      within('#edit_user') do
        fill_in 'Username', with: 'Vasek1'
      end
      click_button 'Update'
      page.should have_content("Current password can't be blank")
      within('#edit_user') do
        fill_in 'Current password', with: '12345678'
      end
      click_button 'Update'
      page.should have_content('You updated your account successfully')
      click_link 'blog'
      click_link 'Delete'
      page.driver.browser.switch_to.alert.accept
      page.should have_content('Your post was deleted')
    end

    it 'should not let user to make 4 unapproved posts' do
      visit '/'
      click_link 'New Post'
      within('#new_post') do
        fill_in 'Title', :with => 'New post creation'
        fill_in 'Body', :with => 'Body of my new post'
        find(:xpath, "//input[@id='post_tags_attributes_0_tag_word']").set 'css'
      end
      click_button 'Create Post'
      page.should have_content('Post was successfully created')
      visit '/'
      click_link 'New Post'
      within('#new_post') do
        fill_in 'Title', :with => 'New post creation 1'
        fill_in 'Body', :with => 'Body of my new post'
        find(:xpath, "//input[@id='post_tags_attributes_0_tag_word']").set 'css'
      end
      click_button 'Create Post'
      page.should have_content('Post was successfully created')
      visit '/'
      click_link 'New Post'
      within('#new_post') do
        fill_in 'Title', :with => 'New post creation 2'
        fill_in 'Body', :with => 'Body of my new post'
        find(:xpath, "//input[@id='post_tags_attributes_0_tag_word']").set 'css'
      end
      click_button 'Create Post'
      page.should have_content('Post was successfully created')
      visit '/'
      click_link 'New Post'
      within('#new_post') do
        fill_in 'Title', :with => 'New post creation'
        fill_in 'Body', :with => 'Body of my new post'
        find(:xpath, "//input[@id='post_tags_attributes_0_tag_word']").set 'css'
      end
      click_button 'Create Post'
      page.should have_content('You cant post more than 3 unapproved posts')
      click_link 'Delete', :match => :prefer_exact
      page.driver.browser.switch_to.alert.accept
      page.should have_content('Your post was deleted')
      click_link 'Delete', :match => :prefer_exact
      page.driver.browser.switch_to.alert.accept
      page.should have_content('Your post was deleted')
      click_link 'Delete'
      page.driver.browser.switch_to.alert.accept
      page.should have_content('Your post was deleted')
    end
  end

end