class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
  belongs_to :user
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags

  has_one_attached :snap
  validates :title, length: { maximum: 40 }
  validates :description, length: { maximum: 500 }
  validates :price_id, numericality: { other_than: 1, message: 'Select' }

end
