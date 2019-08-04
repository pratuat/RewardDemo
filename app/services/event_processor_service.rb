class EventProcessorService
    extend Callable
   
    DATE_INDEX = 0
    TIME_INDEX = 1
    EVENT_TYPE_INDEX = 3
    
    PROCESSORS = {
        "accepts" => 'UserService',
        "recommends" => 'RecommendationService'
    }

    def initialize(event, container)
        @event = event
        self.extend(Object.const_get(PROCESSORS[@event[EVENT_TYPE_INDEX]]))
        @container = container
    end
    
    def event_date_time
        DateTime.strptime(@event[0...2].join(" "), '%Y-%m-%d %H:%M')
    end
end