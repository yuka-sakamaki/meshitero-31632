class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture_code

  with_options presence: true do
    validates :nickname
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :prefecture_code
  end
end
