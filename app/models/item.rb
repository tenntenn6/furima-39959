class Item < ApplicationRecord

  validates :name             ,presence: true
  validates :explanation      ,presence: true
  validates :status_id        ,presence: true
  validates :category_id      ,presence: true
  validates :prefecture_id    ,presence: true
  validates :burden_id        ,presence: true
  validates :shipping_date_id ,presence: true
  validates :price            ,presence: true



  belongs_to :user
  has_one_attached :image
  
end
