# frozen_string_literal: true

module UserService
  USER_NAME_INDEX = 2

  def call
    user = @container.add_user(
      name: @event[USER_NAME_INDEX],
      created_at: event_date_time
    )

    if user && user&.recommender_name
      add_recommendation_points(@container.get_recommender(user), 0)
    end

    user
  end

  def add_recommendation_points(user, k)
    @container.add_points_to_user(user, 1.0 / 2**k)
    recommender = @container.get_recommender(user)

    add_recommendation_points(recommender, k + 1) if recommender
  end
end
