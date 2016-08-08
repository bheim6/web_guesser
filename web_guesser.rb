require 'sinatra'
require 'sinatra/reloader'

secret_number = rand(101)

get '/' do
  "THE SECRET NUMBER is #{secret_number}"
end
