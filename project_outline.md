# Brief outline of the decisions made for the project

### 1. Application Framework

I developed the test application using Sinatra, a ruby micro-framework, considering the fact that the application requirement is limited to one particular feature with single application end-point. A Sinatra application code base would be light, relatively faster and would be easy to setup for a single page application.

### 2. Data Architecture

I implemented the application with non-persisting PORO data coomponents (PORO models and data_container class) under the assumption that the points evaluation would be of a single-session usage. However the underlying models can be easily modified to some persistence model (more likely a database ORM like Sequel or ActiveRecord).

### 2. Application Architecture

The business logic has been implemented within service objects, a layer of ruby classes and modules that houses core business process implementation. This allows separation of concern of the business process from view (controller) and data (model) layers.

We are dealing with two different types of events, one is about user creation and another for recommendation. And often these diffrentiation grows with the application, for example we might need to address other event types in future. To maintain the modularity of components required to process different events, I have used Strategy pattern where the base service (EventProcessorService) identifies corresponding module required to process any given event and extend that module to itself in runtime. This design pattern helps avoid the clutter within the base service and gives good sense of code modularity and testability for different processing strategies.

I implemented **DataContainer** as a mediator to decouple service class from data layer. Hence if we ever intend to change underlying data layer (as to make use of an ORM alongside a database), it would be sufficient to define new data container with same interface. The changes in the data layer could be made with least or no corresponding changes in service layer.

### 4. Testing

I have used gem `rspec` for writing test specs. The test specs were covered for all of the service classes and models, inclusive of test for edge cases as much as possible.

### 5. EDGE CASES
Few of the edge cases identified and the assumptions made to address them in this task are listed below.

1. User creation for existing user
2. Recommendation for existing user
3. Recommendation by non-existing users
4. User creation without prior recommendation
5. Duplicate Recommendation




