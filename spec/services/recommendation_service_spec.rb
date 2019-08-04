require './spec/spec_helper'

RSpec.describe Recommendation do
    let(:data_container) do
        data_container = DataContainer.new
        data_container.add_user(name: "A", created_at: DateTime.now, points: 0)
        data_container
    end
    
    let(:event_params) { ["2018-06-12", "09:41", "A", "recommends", "B"] }
    let(:event_params_2) { ["2018-06-12", "09:41", "C", "recommends", "D"] }
    
    it 'should return a recommendation' do
        object = EventProcessorService.call(event_params, data_container)
        
        expect(object.class).to be(Recommendation)
    end
    
    it 'should add new recommendation to data_container' do
        recommendation = EventProcessorService.call(event_params, data_container)
        
        expect(data_container.recommendations.last).to be(recommendation)
    end
    
    it 'should add new user and recommendation to data_container when recommender does not exist' do
        recommendation = EventProcessorService.call(event_params_2, data_container)
        recommender = data_container.get_recommender(recommendation)
        
        expect(data_container.recommendations.last).to be(recommendation)
        expect(data_container.users.last).to be(recommender)
    end
end