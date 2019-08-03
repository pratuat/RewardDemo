class User
    attr_reader :name, :created_at, :points, :recommender
    
    def initialize(**params)
        @name = params[:name]
        @created_at = params[:created_at]
        @recommender = params[:recommender] 
        
        @points = 0.0
    end
    
    def increment_point(inc)
        @points += inc
    end
end
