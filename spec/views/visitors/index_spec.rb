require "rails_helper"

RSpec.feature "On the homepage" do
    before do
        visit root_path
        @existing_visitor = Visitor.create(email: "ext_user@aol.com",
            password: "123456", password_confirmation: "123456")
        @session = Hash.new
    end

    describe "show different view" do
        scenario "if user is logged-out" do
            @session.nil?
            within "h2" do expect(page).to have_content("Hey Devs, Welcome to my First Rails Project") end
        end

        scenario "if user is logged-in"
            # login_as(@existing_visitor)
        # "Session logged in as: #{@existing_visitor.email}"
    end
end