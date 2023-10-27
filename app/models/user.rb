class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,      presence: true
  validates :birth,         presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :encrypted_password, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :family_name_sei
    validates :family_name_mei
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角(カタカナ)文字を使用してください' } do
    validates :family_name_kana_sei
    validates :family_name_kana_mei
  end

  has_many :items
  has_many :orders

end
