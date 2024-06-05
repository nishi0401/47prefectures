class Record < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: :prefecture_id }
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blank"}
end
