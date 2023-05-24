class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :category_id, :item_condition_id, :delivery_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true

  def was_attached?
    self.image.attached?
  end
end
