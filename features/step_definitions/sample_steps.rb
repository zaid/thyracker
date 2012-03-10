Given /^that I am on the 'Add sample' page$/ do
  visit(new_sample_path)
end

Given /^that I have a sample with values "([^"]*)", "([^"]*)" and "([^"]*)"$/ do |tsh, t3, t4|
  @samples ||= []
  @samples << Factory(:sample, tsh: tsh, t3: t3, t4: t4)
end

Given /^that I am on the home page$/ do
  visit "/"
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

Then /^I should be on the sample details page$/ do
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
  class_name = '.' + field.downcase.gsub(/\s/, '_')
  within(class_name) do
    page.should have_content(value)
  end
end

Then /^I should not see any samples$/ do
  page.should_not have_selector("tr", :class => "sample")
end

Then /^I should see my samples$/ do
  @samples.each do |sample|
    page.should have_content("#{sample.tsh} #{sample.t3} #{sample.t4}")
  end
end
