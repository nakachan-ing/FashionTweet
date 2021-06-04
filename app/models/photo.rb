class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
  belongs_to :user

  has_one_attached :snap
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price_id, numericality: { other_than: 1, message: 'Select' }

end
