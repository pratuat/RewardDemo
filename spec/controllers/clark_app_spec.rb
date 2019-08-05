# frozen_string_literal: true

require './spec/spec_helper'
require 'rack/test'
require 'byebug'

RSpec.describe ClarkApp do
  include Rack::Test::Methods
  
  def app
    ClarkApp.new
  end

  context 'On GET /' do
    it 'returns status 200' do
      get '/'
      expect(last_response).to be_ok
    end
  end
  
  context 'On POST /' do
    it 'returns user points for test_1' do
      post '/', file: Rack::Test::UploadedFile.new('./spec/fixtures/test_1.txt')
      expect(last_response).to be_ok
      expect(CGI.unescapeHTML(last_response.body)).to match(/.*{"A":1.75,"B":1.5,"C":1.0}.*/)
    end
    
    it 'returns user points for test_2' do
      post '/', file: Rack::Test::UploadedFile.new('./spec/fixtures/test_2.txt')
      expect(last_response).to be_ok
      expect(CGI.unescapeHTML(last_response.body)).to match(/.*{"A":1.5,"B":1.0}.*/)
    end
  end
end