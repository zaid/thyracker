require 'spec_helper'

describe "NavigationLinks" do

  describe "GET /" do

    it "should have a 'Home' link" do
      visit "/"
      page.should have_selector("a", :href => root_path, :text => "Home")
    end

    it "should have a 'Contact' link" do
      visit "/contact"
      page.should have_selector("a", :href => contact_path, :text => 'Contact')
    end

    context 'signed-in users' do

      before(:each) do
        @user = FactoryGirl.create(:user)

        visit '/'
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_button 'Sign in'
      end

      it "should show a 'Samples' link" do
        visit '/'
        within('#header') do
          page.should have_link('Samples')
        end
      end

      it "should show a 'Charts' link" do
        visit '/'
        within('#header') do
          page.should have_link('Charts')
        end
      end
    end

    context 'for anonymous users' do

      it "should not show a 'Samples' link" do
        visit '/'
        within('#header') do
          page.should_not have_link('Samples')
        end
      end

      it "should not show a 'Charts' link" do
        visit '/'
        within('#header') do
          page.should_not have_link('Charts')
        end
      end
    end
  end
end
