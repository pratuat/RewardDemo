require './config/environment'

class ClarkApp < Sinatra::Base
    
    set :logging, true
    set :views, 'app/views'
    
    get "/" do
        slim :index
    end
    
    post "/" do
        if params[:file]
            @container = DataContainer.new
            
            events = File.open(params[:file][:tempfile], "r").read.split("\n").map(&:split)
            
            events.each do |event|
                EventProcessorService.call(event, @container)
            end

            user_points = @container.users.inject([]) do |user_points, user|
                user_points << [user.name, user.points] if user.points > 0
                user_points
            end

            @user_points = Hash[user_points]
        end

        slim :index
    end
end

run ClarkApp.run!