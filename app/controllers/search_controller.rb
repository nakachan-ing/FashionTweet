class SearchController < ApplicationController
  def search
    @gender = Gender.find([2, 3, 4])
    @price = Price.find([2, 3, 4, 5, 6])
    @tags = Tag.all.order('created_at DESC')
    @value = params['search']['value']
    @how = params['search']['how']
    @datas = search_for(@how, @value)
  end

  private

  def match_gender(value)
    Photo.where(gender_id: value)
  end

  def match_price(value)
    Photo.where(price_id: value)
  end

  def match_tag(value)
    Photo.where(id: PhotoTag.select(:photo_id)
    .where(tag_id: value)
    .group(:photo_id))
  end

  def keyword(value)
    Photo.where('title LIKE(?) OR description LIKE(?)', "%#{value}%", "%#{value}%")
  end

  def search_for(how, value)
    case how
    when 'match_gender'
      match_gender(value)
    when 'match_price'
      match_price(value)
    when 'match_tag'
      match_tag(value)
    else
      keyword(value)
    end
  end
end
