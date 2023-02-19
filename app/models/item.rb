class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #active_storageとのアソシエーション
  has_one_attached :image
  
  #テーブル間のアソシエーション
  belongs_to :user
  has_one :order

 #アクティブハッシュとのアソシエーション
  belongs_to :postage
  belongs_to :category
  belongs_to :condition
  belongs_to :first_add
  belongs_to :send_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :first_add_id
    validates :send_day_id
    validates :price
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true}
  end

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :first_add_id
    validates :send_day_id
  end
end