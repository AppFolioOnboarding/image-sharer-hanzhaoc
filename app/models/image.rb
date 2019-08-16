class Image < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3 }
  validates :link, presence: true, format: {
    with: /\.(gif|jpg|jpeg|tiff|png)/,
    message: 'Only allows image format.'
  }
end
