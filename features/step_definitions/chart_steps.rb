Then /^I should see a "([^"]*)" chart$/ do |chart_name|
  chart_id = "chart-#{chart_name.downcase}"
  page.should have_selector("div", :id => chart_id)
end
