require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
    context '商品情報入力がうまくいかない時' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまく行かない時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'informationが空だと出品できない' do
        @item.information = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが未選択だと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'stateが未選択だと出品できない' do
        @item.state_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'shippingが未選択だと出品できない' do
        @item.shipping_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'delivery_dayが未選択だと出品できない' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'categoryが---の項目が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが---の項目が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'stateが---の項目が選択されている場合は出品できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'shippingが---の項目が選択されている場合は出品できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'delivery_dayが---の項目が選択されている場合は出品できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.item_price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
      it 'priceが299だと出品できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Out of setting range')
      end
      it 'priceが9999999999999だと出品できない' do
        @item.item_price = '9999999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Out of setting range')
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
