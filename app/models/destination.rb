class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def recent_five
        self.posts.sort_by { |post| post.created_at }.last(5)
    end
    
    def most_likes 
        self.posts.sort_by { |post| post.likes }.last
    end

    def average_age
        total_age = 0
        self.bloggers.uniq.each do |blogger|
            total_age = total_age + blogger.age
        end
        total_age / self.bloggers.size.to_f
    end

end
