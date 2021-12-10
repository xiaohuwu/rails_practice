class Post < ApplicationRecord
    has_many :post_authorings,foreign_key: :authored_post_id
    has_many :post_authors, through: :post_authorings
end
