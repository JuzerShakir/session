require "rails_helper"

RSpec.describe VisitorsController, type: :request do
    describe "GET /" do
        subject { create(:visitor) }

        before do
            get root_path
        end

        it "should return a 200 status code" do
            expect(response).to have_http_status(:ok)
        end

        it "should return number of visitors signed up" do
            expect(response.body).to include("#{Visitor.count}")
        end

        describe "must have different views" do
            it "if user is logged-out" do
                session[:id] = nil
                get root_path
                expect(response.body).to include("Hey Devs, Welcome to my First Rails Project")
            end
            it "if user is logged-in" do
                login_as(subject)
                expect(session[:id]).to_not be_nil
                expect(response).to have_http_status(:found)
                expect(response).to redirect_to root_path
                get root_path
                expect(response.body).to include("Session logged in as: #{subject.email}")
            end
        end
    end

    describe "POST /signup" do
        subject { build(:visitor) }

        it "creates new visitor" do
            expect{
                signup_as(subject)
            }.to change { Visitor.count }.from(0).to(1)
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to root_path
            expect(session[:id]).to_not be_nil
            get root_path
            expect(response.body).to include("#{Visitor.count}")
        end
    end
end