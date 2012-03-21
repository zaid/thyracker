Then /^I should see a page with a title of "([^"]*)"/ do |title|
  page.should have_selector("head title", :text => title)
end

Then /^I should see a sign-up form$/ do
  page.should have_selector("form", id: "new_user")
end
