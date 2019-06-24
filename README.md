
[![Build Status](https://travis-ci.com/Betty-Kebenei/ride-my-way.svg?branch=master)](https://travis-ci.com/Betty-Kebenei/ride-my-way) [![Coverage Status](https://coveralls.io/repos/github/Betty-Kebenei/ride-my-way/badge.svg?branch=master)](https://coveralls.io/github/Betty-Kebenei/ride-my-way?branch=master)


# Ride My Way

An application that Andelans can use to either offer rides to fellow andelans or request for rides from fellow andelans. Built using Ruby on Rails.

## Getting Started
### Prerequisites
- Ruby 
- Rails
- Postgres

### Installing
- Clone this repo using the following command:
`git clone https://github.com/Betty-Kebenei/ride-my-way.git`
- Navigate into the application's directory:
`cd ride-my-way`
- Install the gems required for the application:
`bundle`
- Ensure you have the following environment variables set: (this variables are from google developer's console; they facilitate login with google)

       i. GOOGLE_CLIENT_ID
 
       ii. GOOGLE_CLIENT_SECRET
       
 - Run this command `Editor=vim rails credentials:edit`. This generates a master.key file.
 - Run this command again `Editor=vim rails credentials:edit` to enter the correct database credentials
 - Create database:
 `rake db:create`
 - Make migrations:
 `rake db:migrate`
 - Start the application:
 `rails s`
 - You can access the application on your browser using the port given after running `rails s`.
 
 ### Running the test
 - Run:
 `rspec`
 
 ### Deployment
 This application is running on [Heroku](https://ride-my-way-22.herokuapp.com)
 
 ### Built With
 - Rails
 - ActiveRecord
 - Postgres
 - Omniauth
 - Will_paginate
 - Rake
 - Spectre
 
 ### Authors
 Betty Kebenei
 