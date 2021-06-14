class Photo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :price
  belongs_to :gender
  belongs_to :user
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags

  has_one_attached :snap
  validates :snap, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 500 }
  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :price_id
    validates :gender_id
  end
end
