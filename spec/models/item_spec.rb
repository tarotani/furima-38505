require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品出品ができるとき" do

     it "image,name,text,price,condition_id,postage_id,first_add_id,send_day_id,category_id が存在すれば登録できる" do
      expect(@item).to be_valid
     end

     it "priceが¥300~¥9,999,999であれば登録できる" do
      @item.price = "300"
      expect(@item).to be_valid
     end

     it "priceが半角数値であれば登録できる" do
      @item.price = "300"
      expect(@item).to be_valid
     end
    end

    context "商品出品ができないとき" do
      it "nameが空では登録できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "textが空では登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが¥300~¥9,999,999以外は登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceが半角数値以外は登録できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "confition_idが空では登録できない" do
        @item.condition_id = ""
        @item.valid?

        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "postage_idが空では登録できない" do
        @item.postage_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it "first_add_idが空では登録できない" do
        @item.first_add_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("First add can't be blank")
      end

      it "send_day_idが空では登録できない" do
        @item.send_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
