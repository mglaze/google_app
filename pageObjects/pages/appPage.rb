class AppPage
	include Capybara::DSL

	def initialize
		visit $SETUP['url']
	end

	def fill_in_as(name, email)
		fill_in("First and Last Name ", :with => name)
		fill_in("Email Address", :with => email)
	end

	def exp_selection
		choose('Intermediate')
	end

	def fam_tech
		choose('I\'ve been in industry for more 1-5 years')
	end

	def career_choice
		check('Developer')
	end

	def future_contact
		choose('Yes please')
	end

	def inspirational_paragraph(paragraph)
		fill_in('What inspired you to join the technology industry?', :with => paragraph)
	end

	def submit_form
		click_on('Submit')
	end

	def forgot_password
		click_link "Forgot your password?"
	end

	def login_error
		page.text.include? "Please ensure that your username and password are correct."
	end

end