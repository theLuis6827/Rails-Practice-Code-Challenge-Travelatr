class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    def most_likes 
        self.posts.sort_by { |post| post.likes }.last
    end

    validates :bio, length: {minimum: 30}
    validates :age, numericality: {greater_than: 0}
    validates :name, uniqueness: true

end
