class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :userinfo
  has_rich_text :content
end
