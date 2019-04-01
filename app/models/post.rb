class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  # @post.comments
  validates :title, presence: true, length: { minimum: 3, message: 'タイトルは3文字以上にしてください' }
  validates :body, presence: true
end
