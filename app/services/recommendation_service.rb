module RecommendationService

    RECOMENDER_NAME_INDEX = 2
    RECOMENDEE_NAME_INDEX = 4

    def call
        recommender = @container.find_user_by_name(@event[RECOMENDER_NAME_INDEX])
        
        unless recommender
            recommender = @container.add_user(name: @event[RECOMENDER_NAME_INDEX], created_at: event_date_time)
        end
        
        recommendee_name = @event[RECOMENDEE_NAME_INDEX]
        
        @container.add_recommendation(
            recommender: recommender,
            recommendee_name: recommendee_name,
            created_at: event_date_time
        )
    end
end