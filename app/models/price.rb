class Price < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '0〜1500円' },
    { id: 3, name: '1500〜5000円' },
    { id: 4, name: '5000〜10000円' },
    { id: 5, name: '10000〜20000円' },
    { id: 6, name: '20000円以上' }
  ]

  include ActiveHash::Associations
  has_many :photos
end
