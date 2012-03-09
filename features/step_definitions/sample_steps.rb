Given /^that I am on the 'Add sample' page$/ do
  visit(new_sample_path)
end

When /^I fill the 'Taken on' field with "([^"]*)"$/ do |value|
  date_tokens = value.split('-')
  month_name = Date::MONTHNAMES[date_tokens[1].to_i]

  select(date_tokens[0], :from => 'sample_taken_on_1i')
  select(month_name, :from => 'sample_taken_on_2i')
  select(date_tokens[2], :from => 'sample_taken_on_3i')
end


When /^I fill the "([^"]*)" field with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I click on the "([^"]*)" button$/ do |button_label|
  click_button(button_label)
end

Then /^I should be on the sample details page$/ do
  pending "Implement dynamic titles"
  page.should have_selector('head title', :text => "Thyracker | Sample Details")
end

Then /^I should see a message indicating that the sample was added$/ do
  page.should have_selector("div", :class => "flash success", :text => "Sample added!")
end

Then /^I should see an error message indicating that the sample is missing required fields/ do
  page.should have_selector("div", :id => "error_explanation")
  page.should have_content("can't be blank")
end

Then /^the sample should have "([^"]*)" in the "([^"]*)" field$/ do |value, field|
  page.should have_content("#{field}: #{value}")
end
