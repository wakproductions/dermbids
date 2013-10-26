require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given(/^I visit (.*?)$/) do |webpage|
  visit path_to(webpage)
end

When(/^I click "(.+)"$/) do |link|
  click_link link
end

Then(/^I should see "(.+)"$/) do |content|
  page.should have_content(content)
end

Then(/^I should not see "(.+)"$/) do |content|
  page.should_not have_content(content)
end

#Given /^PENDING/ do |arg1|
#  pending
#end
#
#Given(/^the following (.+) records$/) do |factory, table|
#  table.hashes.each do |hash|
#    FactoryGirl.create(factory, hash)
#  end
#end
#
#Given(/^(\d+) minutes of time has elapsed$/) do |time|
#  Timecop.travel(Time.now + time.to_i.minutes)
#end
#
#Given(/^I go to (.*?)$/) do |webpage|
#  visit path_to(webpage)
#end
#
#
#Then(/^I should see the "(.*?)" button$/) do |content|
#  find_button(content).should_not be_nil
#end
#
#Then(/^I should see "(.*?)"$/) do |content|
#  page.should have_content(content)
#end
#
#Then(/^I should not see "(.*?)"$/) do |content|
#  page.should_not have_content(content)
#end
#
#Then /^I should be on (.*?)$/ do  |webpage|
#  page.current_path.should == path_to(webpage)
#end
#
#When(/^I close my browser \(clearing the session\)$/) do
#  expire_cookies
#end