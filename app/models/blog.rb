class Blog < ApplicationRecord

    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true

    belongs_to :user

    has_many  :blogs_tags,  class_name:"BlogsTags"
    has_many :tags,through: :blogs_tags
    # has_and_belongs_to_many :tags

    def update_tags(tags)
        tags.split(',').each do |tag_name|
            tag = Tag.find_by_name(tag_name)
            Rails.logger.info "tag: #{tag}"
            tag = Tag.create!(name: tag_name) if tag.blank?
            self.tags << tag
        end
    end


end
