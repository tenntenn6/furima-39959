require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  
  describe '商品購入機能' do
    context '購入できる場合' do
      it "すべての項目が記載されていれば（buildingを除く）購入できる" do
        expect(@order).to be_valid
      end
    end
    context '購入できない場合' do
      it "郵便番号が空では購入できない" do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "都道府県名が空では購入できない" do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "市町村が空では購入できない" do
        @order.cities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "番地が空では購入できない" do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "電話番号が空では購入できない" do
        @order.telephone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "販売購入のIDが空では購入できない" do
        @order.order_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "郵便番号にハイフンがなければ購入できない" do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "郵便番号が全角数字だと購入できない" do
        @order.post_code = '１２３４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "電話番号にハイフンがついていると購入できない" do
        @order.telephone = '080-9977-4334'
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
      it "ユーザーと紐づいていないと購入できない" do
         @order.user = nil
         @order.valid?
         expect(@order.errors.full_messages).to include ""
      end
      it "商品を紐づいていないと購入できない" do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include ""
      end
    end
  end






end
