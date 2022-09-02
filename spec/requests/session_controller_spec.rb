require "rails_helper"

RSpec.describe SessionsController, type: :request do
    before do
        @existing_user = Visitor.create(email: "test@aol.com", password: "123456", password_confirmation: "123456")
    end
    describe "GET /login" do
        it "and return ok http status code" do
            get login_path
            expect(response).to have_http_status(:ok)
        end

        it "should redirect to root path if looged-in user visits login page" do
            login_as(@existing_user)
            get login_path
            message = "You're already logged in! If you want to login with different email, then logout first."
            expect(flash[:warning]).to match(/#{message}/)
            expect(response).to redirect_to root_path
            expect(response).to have_http_status(:found)
        end
    end

    describe "POST /login" do
        it "sets session cookie for logged in user" do
            login_as(@existing_user)
            expect(session[:id]).to eq(@existing_user.id)
        end
    end

    describe "DELETE /logout" do
        it "should logout the user and reset the session" do
            login_as(@existing_user)
            delete logout_path
            expect(session[:id]).to be_nil
            expect(response).to have_http_status(:found)
            expect(flash[:info]).to match(/You have successfully logged out./)
            expect(response).to redirect_to root_path
        end
    end
end