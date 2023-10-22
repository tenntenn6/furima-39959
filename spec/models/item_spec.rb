require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it "9項目全ての値が存在すれば作成できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "商品名が空では出品できない" do
         @item.name = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "説明文が空では出品できない" do
         @item.explanation = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "商品状態が空では出品できない" do
         @item.status_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "カテゴリーが空では出品できない" do
         @item.category_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "発送元が空では出品できない" do
         @item.prefecture_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "配送負担が空では出品できない" do
         @item.burden_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Burden can't be blank"
      end
      it "配送日目安が空では出品できない" do
         @item.shipping_date_id = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it "価格が空では出品できない" do
         @item.price = ''
         @item.valid?
         expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "写真がなければ出品できない" do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "価格が全角数字では出品できない" do
         @item.price = '５００'
         @item.valid?
         expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "価格が299円以下では出品できない" do
         @item.price = 299
         @item.valid?
         expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it "価格が1000万以上では出品できない" do
         @item.price = 10_000_000
         @item.valid?
         expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end

    end
  end
  
end


