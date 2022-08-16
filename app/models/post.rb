class Post < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "users_id"
    has_rich_text :content

end
