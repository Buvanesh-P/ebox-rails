class Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "users_id"
    has_rich_text :content
    belongs_to :userinfo, class_name: "Userinfo", foreign_key: "users_id"
    has_many :comment, dependent: :destroy
    has_many :like, dependent: :destroy
    validates :title, presence:true
end
