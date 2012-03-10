When /^I click on the "([^"]*)" link$/ do |link_name|
  click_link(link_name)
end

When /^I click on the "([^"]*)" button$/ do |button_label|
  click_button(button_label)
end
