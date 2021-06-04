class PhotoTag < ApplicationRecord
  belongs_to :photo
  belongs_to :tag
end
# class PhotoTag
#   include ActiveModel::Model

#   attr_accessor :title, :description, :price_id, :user_id, :name
  
#   has_one_attached :snap
#   validates :title, presence: true, length: { maximum: 40 }
#   validates :description, presence: true, length: { maximum: 500 }
#   validates :price_id, numericality: { other_than: 1, message: 'Select' }

#   with_options presence: true do
#     validates :name, presence: true, uniqueness: true
#   end

#   def save
#     tag = Tag.create(name: name)
#     Photo.create(snap: snap, title: title, description: description, price_id: price_id, user_id: user_id, tag_id: tag.id)
#   end
# end