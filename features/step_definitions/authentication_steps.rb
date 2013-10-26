Given /^an? (.+) account is created with the email "(.+)" and password "(.+)"$/ do |account_type, email, password|
  case account_type
    when "administrator"
      FactoryGirl.create(:admin_user, { email: email, password: password })
  end
end

Given /^I am not logged in$/ do
  step "I logout"
end

When /^I logout$/ do
  page.driver.submit :delete, destroy_user_session_path, {}
end

Given /^I log in as "(.+?)" with password "(.+?)"$/ do |username, password|
  unless username.blank?
    visit new_user_session_path
    fill_in "user_email", :with => username
    fill_in "user_password", :with => password
    click_button "Sign in"
  end
end
#
#Given(/^I am logged in as "(.*?)" with password "(.*?)" and the Remember Me option checked$/) do |username, password|
#  unless username.blank?
#    visit new_user_session_path
#    fill_in "user_email", :with => username
#    fill_in "user_password", :with => password
#    check('Remember me')
#    click_button "Sign in"
#  end
#end
#
#Given(/^I am logged in as "(.*?)" with password "(.*?)" without the Remember Me option checked$/) do |email, password|
#  step "I am logged in as \"#{email}\" with password \"#{password}\""
#end
#
#When(/^I try to login as "(.*?)" with password "(.*?)"$/) do |email, password|
#  step "I am logged in as \"#{email}\" with password \"#{password}\""
#end
#
#When /^I submit my email address "(.*)"$/ do |email|
#  fill_in 'user_email', with: email
#  click_button 'Send me reset password instructions'
#end
#
#Then /^an email should have been sent to "(.*)"$/ do |email|
#  ActionMailer::Base.deliveries.last.to.should == [email]
#end
#
#When /I enter "(.*)" as the current password and "(.*)" as the new password/ do |oldpassword, newpassword|
#  fill_in 'user_password', with: newpassword
#  fill_in 'user_password_confirmation', with: newpassword
#  fill_in 'user_current_password', with: oldpassword
#  click_button 'Update'
#end
#
#Given /I am logged in as user "(.*)" and changed my password from "(.*)" to "(.*)"/ do |user, oldpassword, newpassword|
#  step_definitions %{
#    Given I am logged in as "#{user}" with password "#{oldpassword}"
#    When I visit the change password page
#    And I enter "#{oldpassword}" as the current password and "#{newpassword}" as the new password
#  }
#end
