Given /^that I am logged\-in$/ do
  @user = FactoryGirl.create(:user)
  
  visit "/"
  within("#header-signin") do
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_button "Sign in"
  end
end

Given /^that I am not logged\-in$/ do
end

Given /^that I have an existing user account with an email of "([^"]*)"$/ do |email|
  FactoryGirl.create(:user, :email => email)
end

Then /^I should see a message indicating that the sign\-up was successful$/ do
  page.should have_selector('div', class: "flash success", text: 'Sign-up successful!')
end

Then /^I should see an error message indicating that the user already exists$/ do
  page.should have_content('Email is already taken')
end

Then /^I should see an error message indicating that there are missing required fields$/ do
  page.should have_content("can't be blank")
end
