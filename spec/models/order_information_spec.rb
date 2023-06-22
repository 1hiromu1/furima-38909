require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
  before do
    @order_information = FactoryBot.build(:order_information)
  end

  describe '商品購入機能' do
    context '商品購入できるとき' do
      it 'user_id、item_id、post_code、prefecture_id、municipalities、address、building_name、telephone_number, tokenが存在すれば購入できる' do
        expect(@order_information).to be_valid
      end
      it '建物名が無くても購入できる' do
        @order_information.building_name = nil
        expect(@order_information).to be_valid
      end
    end
    context '商品購入できない場合' do
      it 'userが紐付いていなければ購入できない' do
        @order_information.user_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_information.item_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が無ければ購入できない' do
        @order_information.post_code = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみでないと購入できない' do
        @order_information.post_code = 1234567
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が無ければ購入できない' do
        @order_information.prefecture_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が無ければ購入できない' do
        @order_information.municipalities = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が無ければ購入できない' do
        @order_information.address = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が無ければ購入できない' do
        @order_information.telephone_number = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみでないと購入できない' do
        @order_information.telephone_number = '090-1234-5678'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @order_information.token = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

