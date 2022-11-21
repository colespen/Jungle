require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    before(:each) do
      @new_user = User.new(
        first_name: "Rory", last_name: "Maddem",
        email: "rrrmmm@hotmail.com", password: nil,
        password_confirmation: nil
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
  end
end



# puts "~~~~~~~", @new_user.errors.full_messages