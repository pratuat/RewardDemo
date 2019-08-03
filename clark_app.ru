require './config/environment'

class ClarkApp < Sinatra::Base
    
    set :logging, true
    set :views, 'app/views'
    
    before do
        @container = ContainerService.instance
    end
    
    action = lambda do
        
        if params[:file]
            events = File.open(params[:file][:tempfile], "r").read.split("\n").map(&:split)
            
            events.each do |event|
                EventProcessorService.call(event, @container)
            end

            @user_points = @container.list_user_points

            byebug
        end

        slim :index
    end
    
    get "/", &action
    post "/", &action
end

run ClarkApp.run!