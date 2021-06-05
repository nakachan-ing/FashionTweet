class PhotoTagRelation

  include ActiveModel::Model
  attr_accessor :snap, :title, :price_id, :description, :name, :tag_id

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :description, length: { maximum: 500 }
    validates :price_id
    validates :name
  end

  def save
    photo = Photo.create(snap: snap, title: title, price_id: price_id, description: description)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    PhotoTag.create(photo_id: photo.id, tag_id: tag.id)
  end

end