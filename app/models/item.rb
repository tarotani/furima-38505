class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category__id,optional: true
  belongs_to :condition__id,optional: true
  belongs_to :postage__id,optional: true
  belongs_to :first_add__id,optional: true
  belongs_to :send_day__id,optional: true

  belongs_to :user
  #has_one :order

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :postage_id, presence: true
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :first_add_id, presence: true
  validates :first_add_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_day_id, presence: true
  validates :send_day_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_9999_999, only_integer: true}

end