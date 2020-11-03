require 'rails_helper'

RSpec.describe BuyerShoppingAddress, type: :model do
  before do
    @buyer_shopping_address = FactoryBot.build(:buyer_shopping_address)
  end

  describe '商品購入登録' do
    context '商品の購入がうまくいくとき' do
      it '全項目が存在すれば登録できる' do
        expect(@buyer_shopping_address).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @buyer_shopping_address.building = nil
        expect(@buyer_shopping_address).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it 'tokenが空では登録できない' do
        @buyer_shopping_address.token = nil
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @buyer_shopping_address.postal_code = nil
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフン(-)が含まれないと登録できない' do
        @buyer_shopping_address.postal_code = '1234567'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'postal_codeのハイフン以前の文字数が3文字でないと登録できない' do
        @buyer_shopping_address.postal_code = '12-3456'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'postal_codeのハイフン以降の文字数が4文字でないと登録できない' do
        @buyer_shopping_address.postal_code = '123-456'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'prefectureが空だと登録できない' do
        @buyer_shopping_address.prefecture = nil
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefectureが1だと登録できない' do
        @buyer_shopping_address.prefecture = '1'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'cityが空だと登録できない' do
        @buyer_shopping_address.city = nil
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと登録できない' do
        @buyer_shopping_address.address = nil
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @buyer_shopping_address.phone_number = nil
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと登録できない' do
        @buyer_shopping_address.phone_number = '090123456789'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberにハイフンがあると登録できない' do
        @buyer_shopping_address.phone_number = '03-124-678'
        @buyer_shopping_address.valid?
        expect(@buyer_shopping_address.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
