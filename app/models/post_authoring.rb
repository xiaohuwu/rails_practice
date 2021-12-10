class PostAuthoring < ApplicationRecord
    belongs_to :post_author, class_name: "PostUser"
    belongs_to :authored_post, class_name: "Post"
end
