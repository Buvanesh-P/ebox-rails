class Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "users_id"
    has_rich_text :content
    belongs_to :userinfo, class_name: "Userinfo", foreign_key: "users_id"

end
