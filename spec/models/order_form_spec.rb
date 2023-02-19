require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  #user_idやitem_idといった外部キーに数値を直接渡すのは良い実装ではないため、FactoryBotでuser、item情報をそれぞれ作成
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_form = FactoryBot.build(:order_form, item_id: item.id,user_id: user.id)
  end
  #user_idやitem_idといった外部キーに数値を直接渡すのは良い実装ではないため、FactoryBotでuser、item情報をそれぞれ作成

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.postalcode = '123-4567'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_form.first_add_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.second_add = 'test'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.address = '123'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
        @order_form.tel = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_form.postalcode = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postalcode can't be blank", "Postalcode is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_form.postalcode = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_form.first_add_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("First add can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_form.first_add_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("First add can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_form.second_add = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Second add can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_form.tel = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_form.tel = '123-4567-8910'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_form.tel = 12_345_678_910_123_456
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が９桁以下だと保存できないこと' do
        @order_form.tel = 12_345_678_9
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Tel is invalid")
      end
      it 'トークンが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
