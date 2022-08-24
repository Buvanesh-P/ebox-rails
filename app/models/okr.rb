class Okr < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "users_id"
    belongs_to :userinfo, class_name: "Userinfo", foreign_key: "userinfos_id"
    has_rich_text :okr_content
end
