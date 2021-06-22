class SearchController < ApplicationController 

  def search
    @gender = Gender.find([2, 3, 4])
    @price = Price.find([2, 3, 4, 5, 6])
    @tags = Tag.all.order('created_at DESC')
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def match_gender(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Photo.where(gender_id: value)
  end

  def match_price(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Photo.where(price_id: value)
  end

  def keyword(value)
      Photo.where('title LIKE(?) OR description LIKE(?)', "%#{value}%", "%#{value}%")
  end

  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match_gender'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match_gender(value)
    when 'match_price'
      match_price(value)
    else
      keyword(value) 
    end
  end

end
