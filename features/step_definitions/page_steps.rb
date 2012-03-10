Then /^I should see a page with a title of "([^"]*)"/ do |title|
  page.should have_selector("head title", :text => title)
end
