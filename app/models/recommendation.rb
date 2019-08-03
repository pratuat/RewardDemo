class Recommendation
    
    attr_reader :recommender, :recommendee_name, :created_at
    
    def initialize(**params)
        @created_at = params[:created_at]
        @recommender = params[:recommender]
        @recommendee_name = params[:recommendee_name]
    end
end