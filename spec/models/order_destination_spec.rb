require 'rails_helper'
RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end

  
  describe '商品購入機能' do
    context '購入できる場合' do
      it "すべての項目が記載されていれば（buildingを除く）購入できる" do
        expect(@order_destination).to be_valid
        
      end
      it "建物名は空でも購入できる" do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end
    context '購入できない場合' do
      it "郵便番号が空では購入できない" do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Post code can't be blank"
      end
      it "都道府県名が空では購入できない" do
        @order_destination.prefecture_id = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "市町村が空では購入できない" do
        @order_destination.cities = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Cities can't be blank"
      end
      it "番地が空では購入できない" do
        @order_destination.street_address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Street address can't be blank"
      end
      it "電話番号が空では購入できない" do
        @order_destination.telephone = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Telephone can't be blank"
      end
      it "郵便番号にハイフンがなければ購入できない" do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Post code を入力してください"
      end
      it "郵便番号が全角数字だと購入できない" do
        @order_destination.post_code = '１２３４５６７'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Post code を入力してください"
      end
      it "電話番号にハイフンがついていると購入できない" do
        @order_destination.telephone = '080-9977-4334'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Telephone is invalid"
      end
      it "ユーザーと紐づいていないと購入できない" do
         @order_destination.user_id = nil
         @order_destination.valid?
         expect(@order_destination.errors.full_messages).to include "User can't be blank"
      end
      it "商品を紐づいていないと購入できない" do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Item can't be blank"
      end
      it '都道府県名に「---」が選択されている場合は出品できない' do
        @order_destination.prefecture_id = '1'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "tokenか空だと購入できない" do
        @order_destination.token = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include "Token can't be blank"
      end
    end
  end






end

