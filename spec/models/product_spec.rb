require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "flowers")
      @product = Product.new(
        name: "rose", price: 45,
        quantity: 12, category: @category
      )
    end

    context "containing all data" do
      it "is valid" do
        expect(@product).to be_valid
      end
    end

    context "containg all error messages" do
      it "is true" do
        product = Product.new
        expect(product).to_not be_valid
        expect(product.errors.full_messages).to contain_exactly(
          "Category can't be blank",
          "Category must exist",
          "Name can't be blank", 
          "Price can't be blank", 
          "Price cents is not a number", 
          "Price is not a number", 
          "Quantity can't be blank", 
        )
      end
    end

    context "without name data" do
      it "is not valid" do
        @product.name = nil
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to contain_exactly("Name can't be blank") 
      end
    end
    
    context "without price data" do
      it "is not valid" do
        @product.price_cents = nil
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to contain_exactly(
          "Price can't be blank", 
          "Price cents is not a number", 
          "Price is not a number"
        ) 
      end
    end

    context "without quantity data" do
      it "is not valid" do
        @product.quantity = nil;
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to contain_exactly("Quantity can't be blank") 
      end
    end
  
    context "without category data" do
      it "is not valid" do
        @product.category= nil
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to contain_exactly("Category can't be blank", "Category must exist") 
      end
    end
  end
end