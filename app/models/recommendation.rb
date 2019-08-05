# frozen_string_literal: true

class Recommendation
  attr_reader :recommender_name, :recommendee_name, :created_at

  def initialize(**params)
    @created_at = params[:created_at]
    @recommender_name = params[:recommender_name]
    @recommendee_name = params[:recommendee_name]
  end
end
