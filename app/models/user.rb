class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos, dependent: :destroy
  has_many :comments

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, on: :create

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ーa-zA-Z]+\z/ } do
    validates :last_name
    validates :first_name
  end

  validates :nickname, presence: true

  validates :introduction, length: { maximum: 200 }
  has_one_attached :profile_image
end
