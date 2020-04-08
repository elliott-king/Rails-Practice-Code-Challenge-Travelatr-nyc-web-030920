class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true, presence: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def total_likes
    self.posts.sum { |p| p.likes ? p.likes : 0 }
  end
  
  def featured_post
    self.posts.max_by {|p| p.likes ? p.likes : 0 }
  end

  def most_written_about
    self.destinations.uniq.sort_by do |dest|
      dest.posts.filter {|p| p.blogger == self }.count
    end.last(5).reverse
  end
end
