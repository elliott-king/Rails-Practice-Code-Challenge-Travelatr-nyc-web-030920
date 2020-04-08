class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def full_name
    "#{self.name}, #{self.country}"
  end
end
