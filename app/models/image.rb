class Image < ApplicationRecord
  mount_uploader :src, ItemImageUploader
  belongs_to :item
end
