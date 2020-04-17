# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord

  validates :title, :body, :author_id, :presence => true

  belongs_to :author, :class_name => "User"
  has_many :comments, :foreign_key => :post_id
end

# Post.create!(author_id: 1, title: "Who loves active record?", body: "If you like active record say yeah!")

# users = User.joins(:posts).select("users.*, posts.created_at as post_creation_time")