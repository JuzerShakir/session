require "rails_helper"

RSpec.feature "When creating visitor account" do
    let!(:new_visitor) { build(:visitor) }
    let!(:existing_visitor) { create(:visitor) }

    before do
        visit signup_path
    end

    scenario "a new user can sign up" do
        fill_in "email", with: "#{new_visitor.email}"
        fill_in "password", with: "#{new_visitor.password}"
        fill_in "password_confirmation", with: "#{new_visitor.password_confirmation}"
        click_button "Create Visitor"
        expect(page.current_path).to eq(root_path)
        within "header.navbar" do
            expect(page).to have_content("Log Out")
        end
        within "div.alert" do
            expect(page).to have_content("Congrats! You have successfully logged in and a session has been created.")
        end
        within "div#visitor-count" do
            expect(page).to have_content Visitor.all.count
        end
    end

    scenario "all fields should be filled" do
        fill_in "email", with: ""
        fill_in "password", with: ""
        fill_in "password_confirmation", with: ""
        click_button "Create Visitor"
        expect(page.current_path).to eq(signup_path)

        within "div#error_explanation" do
            expect(page).to have_content("Password can't be blank")
            expect(page).to have_content("Email is in invalid format!")
            expect(page).to have_content("Password is too short (minimum is 6 characters)")
        end
    end

    scenario "an existing user cannot sign up again" do
        fill_in "email", with: "#{existing_visitor.email}"
        click_button "Create Visitor"
        expect(page.current_path).to eq(login_path)
        within "div.alert" do
            expect(page).to have_content("#{existing_visitor.email} is already in use! You can Log In with this email.")
        end
    end
end