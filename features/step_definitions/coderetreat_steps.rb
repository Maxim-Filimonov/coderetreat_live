Given(/^there are no coderetreats running today$/) do
end

Coderetreat = Struct.new :status, :location
Given(/^there are some coderetreats running today$/) do
  @coderetreats = [
    Coderetreat.new('not_started', 'Chicago'),
    Coderetreat.new('not_started', 'Seattle'),
    Coderetreat.new('in_session', 'Sydney')
  ]
end

When(/^I go to the running coderetreats display page$/) do
  visit running_today_coderetreats_url
end

Then(/^I should see that there are no coderetreats running$/) do
  page.should have_content('There are no coderetreats running today')
end


Then(/^I should see that coderetreats grouped by status$/) do
  @coderetreats.each do |coderetreat|
    within(".#{coderetreat.status}") do
      page.should have_css('.coderetreat', text: coderetreat.location)
    end
  end
end
