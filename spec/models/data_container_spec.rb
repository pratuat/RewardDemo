require './spec/spec_helper'

RSpec.describe DataContainer do
        
    it { should respond_to :users }
    it { should respond_to :recommendations }
    
    let!(:user_param_a) { { name: "A", created_at: DateTime.now } }
    let!(:user_param_b) { { name: "B", created_at: DateTime.now } }
    let!(:user_param_c) { { name: "C", created_at: DateTime.now } }
    let!(:user_param_d) { { name: "D", created_at: DateTime.now } }
    let!(:user_param_e) { { name: "E", created_at: DateTime.now } }
    
    before(:all) do
        subject.add_user(**user_param_a)
    end
end