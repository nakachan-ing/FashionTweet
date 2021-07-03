class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :sns_credentials
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns } 
  end

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
