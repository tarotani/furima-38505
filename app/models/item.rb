class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :category_id, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
