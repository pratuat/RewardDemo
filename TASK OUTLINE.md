## Briefly document the decisions you’ve taken in the process and why you’ve chosen so.

### 1. Application Framework

I developed the test application using Sinatra, a ruby micro-framework, considering the fact that the application requirement is limited to one particular feature with single application end-point. A Sinatra application code base would be light, relatively faster and would be easy to setup for a single page application.

### 2. Data Architecture

I implemented the application with non-persisting PORO data coomponents (PORO models and data_container class) under the assumption that the points evaluation would be of a single-session usage. However the underlying models can be easily modified to persist using some persistence model (more likely a database ORM like Sequel or ActiveRecord). All the data operation has been interfaced through **DataContainer** class. (throw some SOLID shit ...)

About DataContainer ...

### 2. Application Architecture

The business logic has been implemented within service objects, a layer of ruby classes and modules that houses core business process implementation. This allows separation of concern of the business process from view (controller) and data (model) layers.

We are dealing with two different types of events, one is about user creation and another for recommendation. And often these diffrentiation grows with the application, for example we might need to address other event types in future. To maintain the modularity of components required to process different events, I have used Strategy pattern where the event processor identifies corresponding module required to process any given event and import that module to itself in runtime. This helps avoid the clutter within the base event processor and gives good sense of code modularity.

### 4. Testing
