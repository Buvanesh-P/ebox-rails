class Userinfo < ApplicationRecord
    has_one_attached :profile
    belongs_to :users, class_name: "User", foreign_key: "users_id"
end
