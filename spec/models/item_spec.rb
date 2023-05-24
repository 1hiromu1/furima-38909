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
  end
end
