require "rails_helper"

RSpec.feature "On login page" do
    let!(:new_visitor) { build(:visitor) }
    let!(:existing_visitor) { create(:visitor) }

    before do
        visit login_path
    end

    scenario "when existing user logs in" do
        fill_in "email", with: existing_visitor.email
        fill_in "password",	with: existing_visitor.password
        click_button "Sign In"
        expect(page.current_path).to eq(root_path)
        within "header.navbar" do expect(page).to have_content("Log Out") end
        within "div.alert" do expect(page).to have_content("Welcome Back! A session has been created.") end
        expect(page).to have_content(existing_visitor.email)
    end

    scenario "when new user logs in" do
        fill_in "email", with: new_visitor.email
        fill_in "password",	with: new_visitor.password
        click_button "Sign In"
        expect(page.current_path).to eq(signup_path)
        within "div.alert" do expect(page).to have_content("Email doesn't exist! Please Sign up!") end
    end

    scenario "if submitted fields are empty" do
        click_button "Sign In"
        expect(page.current_path).to eq(login_path)
        within "div.alert" do expect(page).to have_content("Fields cannot be empty!") end
    end

    scenario "if existing user entered an incorrect password" do
        fill_in "email", with: existing_visitor.email
        fill_in "password",	with: "this is wrong password"
        click_button "Sign In"
        expect(page.current_path).to eq(login_path)
        flash_warning_message = "Email exists but the password entered is wrong! Retry!"
        within "div.alert" do expect(page).to have_content(flash_warning_message) end
    end
end