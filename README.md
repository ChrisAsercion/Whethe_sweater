# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* This app was built on Ruby version 7.0.8

* clone or fork this repo
* run `bundle install`

* run `rails db:{drop,create,migrate}`

* to run the test suite execute command `bundle exec rspec`
* there should be 14 passing tests

* The goal of this application is to digest Api information about weather as well as map data to create json objects for a (possible) frontend team to display on their page. The two Api's used in this application are Mapquest for city and route information and WeatherApi for current and future weather predictions

* To access the encrypted keys within this app run `EDITOR="code --wait" rails credentials:edit`

* A mapquest Api key can be found at this site after creating an account: https://developer.mapquest.com/user/login

* For a WeatherApi key please visit this site and create an account: https://www.weatherapi.com/

* The user should be able to find the current weather for a city by passing a city in the location params of their request such as: get `api/v0/forecast?location=Denver, CO`

* The user should be able to find the weather upon arriving to a city by passing in the origin and destination in the body of their request such as:

body = {
  "origin": "Cincinatti,OH",
  "destination": "Chicago,IL",
  "api_key": "t1h2i3s4_i5s6_l7e8g9i10t11"
} 

while visiting: post `api/v0/road_trip`

*The user also has a create and login action for a user that encrypts password credentials