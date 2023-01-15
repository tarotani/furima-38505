class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :first_name, presence: true, inclusion: { in: [/\A[一-龥]+\z/] }
  validates :second_name, presence: true, inclusion: { in: [/\A[一-龥]+\z/] }
  validates :first_name_kana, presence: true, inclusion: { in: [/\A[ァ-ヶー－]+\z/]}
  validates :second_name_kana, presence: true, inclusion: { in: [/\A[ァ-ヶー－]+\z/]}
  validates :birthday, presence: true


end

# 1つのワードの指定
#validates :カラム名, inclusion: { in: ["検証したい文字"] }
