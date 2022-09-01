require "rails_helper"

RSpec.feature "When creating visitor account" do
    scenario "a new user can sign up" do
        visit signup_path
        fill_in "email", with: "test@yahoo.com"
        fill_in "password", with: "123456"
        fill_in "password_confirmation", with: "123456"
        click_button "Create Visitor"
        expect(page).to have_content("Congrats! You have successfully logged in and a session has been created.")
        expect(page.current_path).to eq(root_path)
    end

    scenario "all fields should be filled" do
        visit signup_path
        fill_in "email", with: ""
        fill_in "password", with: ""
        fill_in "password_confirmation", with: ""
        click_button "Create Visitor"
        expect(page.current_path).to eq(signup_path)
        expect(page).to have_content("The form contains 3 errors.")
    end

    scenario "an existing user cannot sign up"
end