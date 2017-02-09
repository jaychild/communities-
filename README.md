<<<<<<< HEAD
# README

This small project is a single page application that uses a Google geocode API to search for locations and retrieve their
addresses. You can then add these places to your favorite locations list. 

To begin, you'll need:

* Ruby version: 2.3.1 @ Rails 5.0

* Database creation:
    - rake db:migrate
    - Populate development and test db with (this just adds the API URL to the lookup table)
        - rake db:seed RAILS_ENV=test 
        - rake db:seed RAILS_ENV=production 

* Deployment instructions: 
    - rails s
    
Once all set-up with the server running, just start searching for your favorite places, such as 'Alton Towers', 'Anfield', 
'Cheddar Gorge'- you get the idea!    

* ...
=======
# favourite places-
A single page site experimenting with Google location APIs
>>>>>>> dc4fb3ea676eda2f69128080e0ff43d1be526280
