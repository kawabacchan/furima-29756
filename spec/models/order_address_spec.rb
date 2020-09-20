require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe "商品購入" do
    context "上手くいく時" do

      it "token, postal_code, prefecture, city, house_number, building, phone_numberが存在する時" do
        expect(@order).to be_valid
      end
      it "buildingが空でも登録できる" do
        @order.building = nil
        expect(@order).to be_valid
      end

    end

    context "上手くいかない時" do

      it "tokenが空では登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      
      it "postal_codeが空では登録できない" do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeにハイフンが無ければでは登録できない" do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      
      it "prefectureが空では登録できない" do
        @order.prefecture = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it "prefectureが1では登録できない" do
        @order.prefecture = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では登録できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      
      it "house_numberが空では登録できない" do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      
      it "phone_numberが空では登録できない" do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが12桁では登録できない" do
        @order.phone_number = "080123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Only numbers")
      end
      
    end
  end

end
