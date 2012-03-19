When /^I click on the "([^"]*)" link$/ do |link_name|
  click_link(link_name)
end

When /^I click on the "([^"]*)" button$/ do |button_label|
  click_button(button_label)
end

When /^I visit "([^"]*)"/ do |url|
  visit(url)
end

Then /^I should see a link labeled "([^"]*)"$/ do |link_name|
  page.should have_selector("a", :text => link_name)
end

Then /^the page title should be "([^"]*)"$/ do |title|
  page.should have_selector("head title", :text => title)
end
