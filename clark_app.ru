require 'sinatra/base'
require 'require_all'
require 'byebug'

require_all 'app'

class ClarkApp < Sinatra::Base
    
    set :logging, true
    set :views, 'app/views'
    
    before do
        @container = ContainerService.instance
    end
    
    action = lambda do
        slim :index
    end
    
    get "/", &action
    post "/", &action
end

run ClarkApp.run!