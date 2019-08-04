require './spec/spec_helper'

RSpec.describe EventProcessorService do
    let(:event_params) { ["2018-06-14", "09:41", "B", "accepts"] }
    
    subject { EventProcessorService.new(event_params, {}) }
    
    it 'should return date' do
        expect(subject.event_date_time).to eq(DateTime.new(2018, 6, 14, 9, 41, 0))
    end
    
    context 'When event type is `accepts`' do
        it 'should extend UserService' do
            expect(subject.singleton_class.included_modules).to include(UserService)
        end
    end
    
    context 'When event type is `recommends`' do
        let(:event_params) { ["2018-06-12", "09:41", "A", "recommends", "B"] }
        
        subject { EventProcessorService.new(event_params, {}) }
        
        it 'should extend RecommendationService' do
            expect(subject.singleton_class.included_modules).to include(RecommendationService,)
        end
    end
end

