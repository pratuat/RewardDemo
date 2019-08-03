require 'sinatra/base'
require 'require_all'
require 'byebug'

require_all 'app'

class ClarkApp < Sinatra::Base
    
    set :logging, true
    set :views, 'app/views'
    
    action = lambda do
        slim :index
    end
    
    get "/", &action
    post "/", &action
end

run ClarkApp.run!