# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe DataContainer do
  it { should respond_to :users }
  it { should respond_to :recommendations }

  let!(:user_a) { subject.add_user(name: 'A', created_at: DateTime.now) }
  let!(:recommendation_ba) do
    subject.add_recommendation(
      created_at: DateTime.now,
      recommender_name: 'A',
      recommendee_name: 'B'
    )
  end
  let!(:user_b) { subject.add_user(name: 'B', created_at: DateTime.now, recommender_name: 'A') }
  let!(:recommendation_ca) do
    subject.add_recommendation(
      created_at: DateTime.now,
      recommender_name: 'A',
      recommendee_name: 'C'
    )
  end
  let!(:user_c) { subject.add_user(name: 'C', created_at: DateTime.now, recommender_name: 'A') }
  let!(:recommendation_db) do
    subject.add_recommendation(
      created_at: DateTime.now,
      recommender_name: 'B',
      recommendee_name: 'D'
    )
  end
  let!(:recommendation_dc) do
    subject.add_recommendation(
      created_at: DateTime.now,
      recommender_name: 'C',
      recommendee_name: 'D'
    )
  end
  let!(:user_d) { subject.add_user(name: 'D', created_at: DateTime.now, recommender_name: 'B') }
  let!(:recommendation_ed) do
    subject.add_recommendation(
      created_at: DateTime.now,
      recommender_name: 'D',
      recommendee_name: 'E'
    )
  end
  let!(:user_e) { subject.add_user(name: 'E', created_at: DateTime.now, recommender_name: 'D') }

  let!(:users) { [user_a, user_b, user_c, user_d, user_e] }
  let!(:recommendations) { [recommendation_ba, recommendation_ca, recommendation_db, recommendation_dc, recommendation_ed] }

  context '#users' do
    it 'should return all users' do
      expect(subject.users).to match_array(users)
    end
  end

  context '#recommendations' do
    it 'should return all users' do
      expect(subject.recommendations).to match_array(recommendations)
    end
  end

  context '#list_user_points' do
    pending('YTBD')
    it 'should return user points' do
    end
  end

  context '#add_user' do
    let!(:user_params_e) { { name: 'E', created_at: DateTime.now, recommender_name: 'D' } }
    let!(:user_params_f) { { name: 'F', created_at: DateTime.now, recommender_name: 'D' } }

    it 'should not add user with existing name' do
      users_length = subject.users.length
      expect(subject.add_user(user_params_e)).to be_nil
      expect(subject.users.length).to eq(users_length)
    end

    it 'should add user with new name' do
      users_length = subject.users.length
      expect(subject.add_user(user_params_f)).to be_an_instance_of(User)
      expect(subject.users.length).to eq(users_length + 1)
    end
  end

  context '#add_recommendation' do
    let!(:recommendation_params_fe) { { created_at: DateTime.now, recommender_name: 'E', recommendee_name: 'F' } }

    it 'should add new recommendation' do
      recommendations_length = subject.recommendations.length
      expect(subject.add_recommendation(recommendation_params_fe)).to be_an_instance_of(Recommendation)
      expect(subject.recommendations.length).to eq(recommendations_length + 1)
    end
  end

  context '#find_user_by_name' do
    it 'should return user matched by name' do
      expect(subject.find_user_by_name('C')).to eq(user_c)
    end

    it 'should return nil for unmatched name' do
      expect(subject.find_user_by_name('Z')).to be_nil
    end
  end

  context '#find_recommendation_by_recommendee_name' do
    it 'should return first recommendation matched by recommendee_name' do
      expect(subject.find_recommendation_by_recommendee_name('D')).to eq(recommendation_db)
    end

    it 'should return nil for unmatched recommendation' do
      expect(subject.find_recommendation_by_recommendee_name('Z')).to be_nil
    end
  end

  context '#add_points_to_user' do
    let!(:user_params_f) { { name: 'F', created_at: DateTime.now, recommender_name: 'D' } }

    it 'should add points to user' do
      z = (x, y = [rand, rand]).sum
      user = subject.add_user(user_params_f.merge(points: x))
      subject.add_points_to_user(user, y)
      expect(user.points).to eq(z)
    end
  end
end
