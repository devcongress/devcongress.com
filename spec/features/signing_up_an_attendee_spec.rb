require 'spec_helper'

feature 'Signing Up an Attendee' do
	before do
		visit '/'
		click_link 'Register'
	end

	scenario 'can signup an attendee' do

		fill_in 'Name', 				with: 'Guy Developer'
		fill_in 'Email',				with: 'guy@developer.me'
		fill_in 'Github',				with: 'guy_developer'
		fill_in 'Twitter',			with: 'guy_developer'
		fill_in 'Linkedin', 		with: 'guy_developer'
		fill_in 'Website',  		with: 'http://guydeveloper.me'
		fill_in 'Interests',		with: 'Snorkeling when away from my computer'
		fill_in 'Specialty',		with: 'Database normalization'
		fill_in 'Expectation', 	with: 'I want to be able to share my experience'
		click_button 'I am attending DevCongress so Sign me up!'

		expect(page).to have_content 'Yay! You are definitely attending DevCongress :)'
		expect(page.current_url).to eql(agenda_url)

		title = 'Playground'
		expect(page).to have_title(title)
	end

	scenario 'cannot signup an attendee without name and expectation' do
		
		click_button 'I am attending DevCongress so Sign me up!'

		expect(page).to have_content 'Registration failed :('
		expect(page).to have_content 'Name can\'t be blank'
		expect(page).to have_content 'Expectation can\'t be blank' 
	end
end