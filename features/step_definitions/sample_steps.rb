Given /^that I am on the 'Add sample' page$/ do
  visit(new_sample_path)
end

Given /^that I have a sample with values "([^"]*)", "([^"]*)" and "([^"]*)"$/ do |tsh, t3, t4|
  @samples ||= []
  @samples << FactoryGirl.create(:sample, user: @user, tsh: tsh, t3: t3, t4: t4)
end

Given /^that I am on the home page$/ do
  visit "/"
end

Given /^that I am on the sample listing page$/ do
  visit "/samples"
end

Given /^that I am on the sample details page$/ do
  visit sample_path(@samples.first)
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

When /^I click the 'Delete' button for the first sample$/ do
  within(".samples") do
    page.find("tr", :text => @samples.first.tsh.to_s).click_link "Delete"
  end
end

When /^I click the 'Delete' button$/ do
  click_link("Delete")
end

When /^I click the 'Update' button for the first sample$/ do
  within(".samples") do
    page.find("tr", :text => @samples.first.tsh.to_s).click_link "Update"
  end
end

Then /^I should be on the sample details page$/ do
  page.should have_selector('head title', :text => "Thyracker | Sample Details")
end

Then /^I should see a message indicating that the sample was "([^"]*)"$/ do |action_name|
  page.should have_selector("div", :class => "flash success", :text => "Sample #{action_name}!")
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

Then /^I should see a "([^"]*)" button for each sample$/ do |button_label|
  @samples.each do |sample|
    page.should have_link("Details", :href => sample_path(sample))
  end
end

Then /^the first sample should be deleted$/ do
  @user.reload
  @user.samples.where(_id: @samples.first.id).exists?.should be_false
end

Then /^the second sample should not be deleted$/ do
  @user.reload
  @user.samples.where(_id: @samples.second.id).exists?.should be_true
end

Then /^the sample should be deleted$/ do
  @user.reload
  @user.samples.where(_id: @samples.first.id).exists?.should be_false
end
