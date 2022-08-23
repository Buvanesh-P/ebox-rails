class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :post, class_name: "Post", foreign_key: 'users_id'
  has_many :comment, dependent: :destroy
  has_one :userinfo, dependent: :destroy
  has_many :like, dependent: :destroy
end
