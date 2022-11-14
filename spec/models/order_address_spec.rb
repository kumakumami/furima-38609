require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'addressline2は空でも保存できること' do
        @order_address.addressline2 = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipが空だと保存できないこと' do
        @order_address.zip = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.zip = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip is invalid. Include hyphen(-)')
      end
      it 'stateを選択していないと保存できないこと' do
        @order_address.state_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("State can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addlessline1が空だと保存できないこと' do
        @order_address.addressline1 = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addressline1 can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @order_address.tell = " "
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellが全角数字だと保存できないこと' do
        @order_address.tell = '２０００２０００２０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell is invalid')
      end
      it 'tellが12桁だと保存できないこと' do
        @order_address.tell = '123456789100'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell is invalid')
      end
      it 'tellが9桁だと保存できないこと' do
        @order_address.tell = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell is invalid')
      end
      it 'tellに半角のハイフンを含んでいると保存できないこと' do
        @order_address.tell = '123-4567-8910'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tell is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
        it 'itemが紐付いていないと保存できないこと' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end