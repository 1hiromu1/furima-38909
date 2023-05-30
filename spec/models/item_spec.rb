require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'item_name,item_description,category_id,item_condition_id,delivery_id,prefecture_id,days_to_ship_id,price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '商品画像がない場合、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名がない場合、登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明がない場合、登録できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it 'カテゴリーの情報がない場合、登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態の情報がない場合、登録できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
      it '配送料の負担の情報がない場合、登録できない' do
        @item.delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it '発送元の地域の情報がない場合、登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数の情報がない場合、登録できない' do
        @item.days_to_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank"
      end
      it '価格の情報がない場合、登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it '価格が300未満の場合、登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it '価格が9,999,999より大きい場合、登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '価格が半角数値でない場合、登録できない' do
        @item.price = "abc"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
