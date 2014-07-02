Given(/^I am a woman interested in the Google Program$/) do
  FromAppPage = AppPage.new
  FromAppPage.fill_in_as($SETUP['user']['name'],$SETUP['user']['email'])
  

end

When(/^I fill in the application$/) do
  FromAppPage.exp_selection
  FromAppPage.fam_tech
  FromAppPage.career_choice
  FromAppPage.future_contact
  FromAppPage.inspirational_paragraph($SETUP['user']['paragraph'])
end

Then(/^I submit the form$/) do
  FromAppPage.submit_form
end