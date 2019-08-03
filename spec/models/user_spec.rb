require './spec/spec_helper'

RSpec.describe User do
    
    it { should respond_to :name }
    it { should respond_to :points }
    it { should respond_to :created_at }
    it { should respond_to :recommender }
    
    it 'should have name' do
        name = Faker::Name.name
        user = User.new(name: name)        
        expect(user.name).to eq(name)
    end
    
    it 'should have points' do
        user = User.new()
        expect(user.points).to eq(0.0)
        
        x = rand
        user = User.new(points: x)
        expect(user.points).to eq(x)
    end
    
    it 'should have created_at' do
        created_at = DateTime.now
        user = User.new(created_at: created_at)
        expect(user.created_at).to eq(created_at)
    end
    
    it 'should have recommender' do
        recommender = User.new
        user = User.new(recommender: recommender)
        expect(user.recommender).to eq(recommender)
    end
    
    it 'should increment points' do
        z = (x, y = [rand, rand]).sum
        user = User.new(points: x)
        user.increment_point(y)
        expect(user.points).to eq(z)
    end
end