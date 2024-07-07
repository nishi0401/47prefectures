class Record < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: :prefecture_id, message: "が選択した都道府県の記録は既に存在しています" }
  validates :prefecture_id, numericality: {  in: 1..47  , message: "を選択してください"}
end
