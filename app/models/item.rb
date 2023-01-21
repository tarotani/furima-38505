class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :conditions
  belongs_to :postages
  belongs_to :firsts_add
  belongs_to :sends_day

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, presence: true
  validates :conditions_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :postage_id, presence: true
  validates :postages_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :first_add_id, presence: true
  validates :firsts_add_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :send_day_id, presence: true
  validates :sends_day_id, numericality: { other_than: 1, message: "can't be blank"}

end
