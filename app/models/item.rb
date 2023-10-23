class Item < ApplicationRecord
  validates :name,           presence: true
  validates :explanation,    presence: true
  validates :status_id,      presence: true
  validates :category_id,    presence: true
  validates :prefecture_id,  presence: true
  validates :burden_id,      presence: true
  validates :shipping_date_id, presence: true
  validates :price,          presence: true
  validates :image,          presence: true

  validates :price, numericality: { greater_than: 299, less_than_or_equal_to: 9_999_999, only_integer: true }

  validates :category_id, :status_id, :prefecture_id, :burden_id, :shipping_date_id,
            numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :shipping_date
end
