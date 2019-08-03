require 'singleton'

class ContainerService
    include Singleton
    
    attr_reader :users, :recommendations

    def initialize
        @users = []
        @recommendations = []
    end
    
    def find_user_by_name(name)
        return @users.find { |user| user.name == name }
    end
    
    def find_recommendation_for_user(name)
        recommendations = @recommendations.find_all { |el| el.recommendee_name == name }
        
        return recommendations.sort_by(&:created_at).first
    end
    
    def add_user(**user_params)
        user = User.new(**user_params)
        @users << user
        
        return user
    end
    
    def add_recommendation(**recommendation_params)
        recommendation = Recommendation.new(**recommendation_params)
        @recommendations << recommendation
        
        return recommendation
    end
    
    def get_recommender(object)
        return object&.recommender
    end
    
    def add_points_to_user(user, points)
        user.increment_point(points)
    end
    
    def list_user_points
        arr = @users.inject([]) do |arr, user|
            arr << [user.name, user.points] if user.points > 0
            arr
        end
        
        return Hash[arr]
    end
end