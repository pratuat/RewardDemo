module UserCreationService

    USER_NAME_INDEX = 2

    def call
        user = @container.find_user_by_name(@event[USER_NAME_INDEX])
        
        return if user
    
        recommendation = @container.find_recommendation_for_user(@event[USER_NAME_INDEX])
        recommender = @container.get_recommender(recommendation)
        
        user = @container.add_user(
            name: @event[USER_NAME_INDEX],
            recommender: recommender,
            created_at: event_date_time
        )

        if recommender
            add_recommendation_points(recommender, 0)
        end
    end
    
    def add_recommendation_points(user, k)
        @container.add_points_to_user(user, 1.0/2**k)
        recommender = @container.get_recommender(user)
        
        if recommender
            add_recommendation_points(recommender, k+1)
        end
    end
end