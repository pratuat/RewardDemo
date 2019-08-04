require './spec/spec_helper'

RSpec.describe UserService do
    let(:data_container) do
        data_container = DataContainer.new
        data_container.add_user(name: "A", created_at: DateTime.now, points: 0)
        data_container.add_recommendation(
            created_at: DateTime.now,
            recommender_name: "A",
            recommendee_name: "B"
        )
        data_container
    end
    
    let(:event_params) { ["2018-06-14", "09:41", "B", "accepts"] }
    let(:event_params_2) { ["2018-06-14", "09:41", "C", "accepts"] }
    
    it 'should return a user' do
        object = EventProcessorService.call(event_params, data_container)
        expect(object.class).to be(User)
    end
    
    it 'should add new user to data_container' do
        user = EventProcessorService.call(event_params, data_container)
        expect(data_container.users.last).to be(user)
    end
    
    it 'should add points to recommenders' do
        user_b = EventProcessorService.call(event_params, data_container)
        user_a = data_container.get_recommender(user_b)
        data_container.add_recommendation(
            created_at: DateTime.now,
            recommender_name: user_b.name,
            recommendee_name: "C"
        )
        user_c = EventProcessorService.call(event_params_2, data_container)
        
        expect(user_c.points).to eq(0)
        expect(user_b.points).to eq(1)
        expect(user_a.points).to eq(1.5)
    end
end