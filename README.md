# CLARK REWARD

### **PROJECT SETUP**

#### 1. Clone the repository
The repository can be downloaded by using the github file download link or can be cloned locally using the following command.
```
$ git clone git@github.com:pratuat/clark_sinatra.git
```

#### 2. Install dependencies
Go inside the project directory and use bundler to install gem dependencies.
```
$ cd YOUR_PATH_TO_PROJECT_DIRECTORY
```
```
$ bundle install
```

#### 3. Start server
Run rack server.
```
$ bundle exec rackup clark_app.ru
```

#### 4. Access web application in browser
By default rack server runs application at port no. 4567. Go to link http://127.0.0.1:4567/ in your browser.
For additional options, use rack help command as
```
$ bundle exec rackup --help
```

#### 5. Test web service
Two test files are made available under `spec/fixtures` which can be used to test the web application.

#### 6. Running tests
Run rspec test suite using following command.
```
$ bundle exec rspec spec
```





