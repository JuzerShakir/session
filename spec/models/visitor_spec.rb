require "rails_helper"

RSpec.describe Visitor, :type => :model do
    subject { described_class.new(
        email: "test@aol.com",
        password: "123456",
        password_confirmation: "123456"
    ) }

    it "email should be valid" do
        ValidatesEmailFormatOf::validate_email_format(subject.email)
    end

    it "email should be unique" do
        expect(Visitor.find_by(email: subject.email)).to be_nil
    end

    it "passwords should match" do
        expect(subject.password).to eq(subject.password_confirmation)
    end

    it "passwords should be within the range of 6 to 36 characters" do
        expect(subject.password.length).to be_between(6, 36)
    end

    it "should be valid" do
        expect(subject).to be_valid
    end
end