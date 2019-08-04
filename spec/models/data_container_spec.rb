require './spec/spec_helper'

RSpec.describe DataContainer do
        
    it { should respond_to :users }
    it { should respond_to :recommendations }
    
    context "User" do
        let!(:user_a) { subject.add_user(name: "A", created_at: DateTime.now) }
        let!(:user_b) { subject.add_user(name: "B", created_at: DateTime.now, recommender_name: 'A') }
        let!(:user_c) { subject.add_user(name: "C", created_at: DateTime.now, recommender_name: 'A') }
        let!(:user_d) { subject.add_user(name: "D", created_at: DateTime.now, recommender_name: 'B') }
        let!(:user_e) { subject.add_user(name: "E", created_at: DateTime.now, recommender_name: 'D') }
        
        let!(:users) { [user_a, user_b, user_c, user_d, user_e] }
        
        context "#users" do
            it 'should return all users' do
                expect(subject.users).to match_array(users)
            end
        end
        
        context "#add_user" do
            let!(:user_params_e) { { name: "E", created_at: DateTime.now, recommender_name: 'D' } }
            let!(:user_params_f) { { name: "F", created_at: DateTime.now, recommender_name: 'D' } }
            
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
        
        context "#find_user_by_name" do
            it 'should return user matched by name' do
                expect(subject.find_user_by_name("C")).to eq(user_c)
            end
            
            it 'should return nil for unmatched name' do
                expect(subject.find_user_by_name("Z")).to be_nil
            end
        end
    end
    
    context "Recommendation" do
        
    end
end