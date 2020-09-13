class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,　presense: true
  with_options presence: true, format: {with: /\A[ぁ-んァ-ンー-龥]+\z/} do
    validates :family_name,　presense: true
    validates :first_name,　presense: true
  end
  with_options presence: true, format: {with: /\A[ァ-ン]+\z/} do
    validates :family_kananame,　presense: true
    validates :first_kananame,　presense: true
  end
  validates :birthday,　presense: true
end