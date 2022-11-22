require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    before(:each) do
      @new_user = User.new(
        first_name: "Rory", last_name: "Maddem",
        email: "rrrmmm@hotmail.com", password: "12345678",
        password_confirmation: "12345678"
      )
    end
    
    describe "password and password_confirmation" do
      it "should match" do
        @new_user.password = "321"
        @new_user.password_confirmation = "123"
        expect(@new_user).to_not be_valid
      end
      it "are required" do
        @new_user.password = nil
        @new_user.password_confirmation = nil
        expect(@new_user).to_not be_valid
      end
      it "should have min. length of 8 characters" do
        @new_user.password = "1234567"
        @new_user.password_confirmation = "1234567"
        expect(@new_user).to_not be_valid
      end
    end
    
    describe ".authenticate_with_credentials" do
      it "if user credentials not found return nil" do
        # save user to database first before authenticate
        @new_user.save 
        email = nil
        password = nil
        # self.authenticate!!! needs User.class.
        expect(User.authenticate_with_credentials(email, password)).to eql(nil)
      end
      it "emails with whitespace are successful" do
        @new_user.save 
        email = " rrrmmm@hotmail.com "
        password = "12345678"
        user_auth = User.authenticate_with_credentials(email, password)
        expect(user_auth.email).to eql("rrrmmm@hotmail.com")
      end
      it "emails with any case are successful" do
        @new_user.save 
        email = " rRrMmM@HoTmAiL.CoM "
        password = "12345678"
        user_auth = User.authenticate_with_credentials(email, password)
        expect(user_auth.email).to eql("rrrmmm@hotmail.com")
      end
    end
  end
end