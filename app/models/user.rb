class User
    attr_reader :name, :created_at, :points, :recommender_name
    
    def initialize(**params)
        @name = params[:name]
        @created_at = params[:created_at]
        @recommender_name = params[:recommender_name]
        @points = params[:points].to_f || 0.0
    end
    
    def increment_point(inc)
        @points += inc
    end
end
