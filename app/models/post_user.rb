class PostUser < ApplicationRecord
    has_many :post_authorings,foreign_key: :post_author_id
    has_many :authored_posts, through: :post_authorings,source: :authored_post
end
