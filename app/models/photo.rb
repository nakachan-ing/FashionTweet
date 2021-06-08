class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
  belongs_to :user
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags

  has_one_attached :snap
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :price_id, presence: true, numericality: { other_than: 1, message: 'Select' }
end
