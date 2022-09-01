require "rails_helper"

# Creating New Visitor Account
    # visit root path
    # click on 'Sign Up' link
    # fill in the form
    # click on "Create Visitor" button
    # redirect to root path
    # have content "Congrats! You have successfully logged in and a session has been created."

RSpec.feature "Creating Visitor Account" do
    scenario "when new user signs up" do
        visit signup_path
        fill_in "email", with: "test@yahoo.com"
        fill_in "password", with: "123456"
        fill_in "password_confirmation", with: "123456"
        click_button "Create Visitor"
        expect(page).to have_content("Congrats! You have successfully logged in and a session has been created.")
        expect(page.current_path).to eq(root_path)
    end
end