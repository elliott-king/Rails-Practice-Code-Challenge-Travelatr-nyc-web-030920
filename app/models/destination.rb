class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def full_name
    "#{self.name}, #{self.country}"
  end

  def featured_post
    self.posts.max_by {|p| p.likes } 
  end

  def most_recent_posts
    self.posts.sort_by { |p| p.created_at }.last(5).reverse
  end

  def average_age    
    if self.bloggers.count > 0
      (self.bloggers.sum { |b| b.age }/self.bloggers.count).to_i
    else
      0
    end
  end
end
