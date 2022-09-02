require "rails_helper"

RSpec.describe VisitorsController, type: :request do
    describe "GET /" do
        before do
            get root_path
        end

        it "should return a 200 status code" do
            expect(response).to have_http_status(:ok)
        end

        describe "must have different views" do
            it "if user is logged-out" do
                session[:id] = nil
                get root_path
                expect(response.body).to include("Hey Devs, Welcome to my First Rails Project")
            end
            it "if user is logged-in" do
                visitor = Visitor.create(email: "test2@aol.com",
                    password: "123456", password_confirmation: "123456")
                login_as(visitor)
                expect(session[:id]).to_not be_nil
                expect(response).to have_http_status(:found)
                expect(response).to redirect_to root_path
                get root_path
                expect(response.body).to include("Session logged in as: #{visitor.email}")
            end
        end
    end

    describe "POST /signup" do
        before do
            @existing_visitor = Visitor.new(email: "test2@aol.com",
                password: "123456", password_confirmation: "123456")
        end
        it "creates new visitor" do
            expect{
                signup_as(@existing_visitor)
            }.to change { Visitor.count }.from(0).to(1)
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to root_path
            expect(session[:id]).to_not be_nil
        end
    end
end