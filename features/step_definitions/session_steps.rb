Then /^I should not be logged\-in$/ do
  within("#header") do
    page.should have_selector('form', class: 'new_session')
  end
end

Then /^I should be logged\-in$/ do
  within("#header") do
    page.should_not have_selector('form', class: 'new_session')
  end
end

Then /^I should see an error about invalid credentials$/ do
  page.should have_content('Invalid credentials')
end

Then /^I should see a message indicating successful login$/ do
  page.should have_selector('div', :class => 'alert success',  :text => 'Signed-in successfully')
end
