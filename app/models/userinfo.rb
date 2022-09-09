class Userinfo < ApplicationRecord
    has_one_attached :profile
    belongs_to :users, class_name: "User", foreign_key: "users_id"
    has_many :comment, dependent: :destroy
    has_many :like, dependent: :destroy
    has_many :okr, dependent: :destroy
    validates :profile,:fullname,:address,:city,:designation,:phone,:emp_id,:emergency_number,:doj,:blood_group,:department,:dob,:users_id, presence: true
end
