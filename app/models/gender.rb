class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Baby' },
    { id: 3, name: 'Boy' },
    { id: 4, name: 'Girl' }
  ]

  include ActiveHash::Associations
  has_many :photos
end
