# frozen_string_literal: true

module RecommendationService
  RECOMENDER_NAME_INDEX = 2
  RECOMENDEE_NAME_INDEX = 4

  def call
    # skip if recommended user already exists
    return if @container.find_user_by_name(@event[RECOMENDEE_NAME_INDEX])

    recommender = get_recommender
    recommendee_name = @event[RECOMENDEE_NAME_INDEX]

    @container.add_recommendation(
      recommender_name: recommender.name,
      recommendee_name: recommendee_name,
      created_at: event_date_time
    )
  end

  # returns user instance for recommender
  def get_recommender
    recommender = @container.find_user_by_name(@event[RECOMENDER_NAME_INDEX])

    # edge case: create user for non-existing recommnder.
    unless recommender
      recommender_create_event = @event[0..2].append('accepts')
      recommender = EventProcessorService.call(recommender_create_event, @container)
    end

    recommender
  end
end
