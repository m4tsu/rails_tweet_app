class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy                                
                                  
                                  
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  
  
  def posts
    return Post.where(user_id: self.id)
  end
  
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  
  
end

# test用user name:test_user email:test@sample.com pass:password