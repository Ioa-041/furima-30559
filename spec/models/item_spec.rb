require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context "商品の出品登録がうまくいくとき" do
      it "全項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it "priceが半角数字で300円から9,999,999円の間あれば登録できる" do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end

    context "商品の出品登録がうまくいかないとき" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explainが空では登録できない" do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "sales_status_idが空では登録できない" do
        @item.sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it "scheduled_idが空では登録できない" do
        @item.scheduled_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled can't be blank")
      end

      it "shipping_fee_status_idが空では登録できない" do
        @item.shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが300円から9,999,999円の間でないと登録できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "priceが半角数字でないと登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include( "Price Half-width number")
      end

      it "userが紐づいてないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
