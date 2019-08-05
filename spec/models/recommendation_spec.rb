# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Recommendation do
  it { should respond_to :created_at }
  it { should respond_to :recommender_name }
  it { should respond_to :recommendee_name }

  it 'should have created_at' do
    created_at = DateTime.now
    recommendation = Recommendation.new(created_at: created_at)
    expect(recommendation.created_at).to eq(created_at)
  end

  it 'should have recommender_name' do
    recommender_name = Faker::Name.name
    recommendation = Recommendation.new(recommender_name: recommender_name)
    expect(recommendation.recommender_name).to eq(recommender_name)
  end

  it 'should have recommendee_name' do
    recommendee_name = Faker::Name.name
    recommendation = Recommendation.new(recommendee_name: recommendee_name)
    expect(recommendation.recommendee_name).to eq(recommendee_name)
  end
end
