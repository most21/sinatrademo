require 'sinatra'
require 'sinatra/json'
require 'pg'
require 'sinatra/activerecord'

# Next version using a PostgreSQL database
class Cake < ActiveRecord::Base
end

get '/' do
  redirect '/cakes'
end

# Read all rows
get '/cakes' do
  @cakes = Cake.all # query database for all rows in the cakes table
  erb :index
end

# Add a cake to the database
get '/cakes/new' do # this route displays the input form
  erb :add_cake
end

post '/cakes' do # this route processes the input
  c = Cake.create(name: params["name"])
  redirect '/cakes'
end

# Edit an existing cake in the database
get '/cakes/edit' do
  erb :edit_cake
end

put '/cakes' do
  c = Cake.find_by(id: params["id"]) # find existing row
  c.update(name: params["name"]) # update cake name
  redirect '/cakes'
end

# Delete a cake from the database
get '/cakes/delete' do
  erb :delete_cake
end

delete '/cakes' do
  Cake.find(params[:id]).destroy # find and destroy (eat?) the cake
  redirect '/cakes'
end

# Read a single row - this needs to be the last route so that cakes/new, cakes/edit and cakes/delete are handled correctly
get '/cakes/:id' do
  # Query database and display
  data = Cake.find_by(id: params[:id])
  data.name # display cake name
end



# Next version using a JSON endpoint
# get '/' do
#   erb :index
# end
#
# get '/cakes.json' do
#   # Read file
#   file = File.open("cake.list")
#   data = file.readlines
#   file.close
#
#   # Return cake list as JSON
#   json :cake_list => data
# end

# Better version using views/templates
# get '/' do
#   # Read file
#   file = File.open("cake.list")
#   data = file.readlines
#   file.close
#
#   # Create view
#   erb :index, :locals => {:cake_list => data}
# end

# Simple version using string manipulation
# get '/' do
#   # Read data from file
#   file = File.open("cake.list")
#   data = file.readlines
#   file.close
#
#   # Build an output string in the form of a numbered list
#   for i in 0..data.length-1
#     data[i] = "#{i + 1}. #{data[i]}" # modify each element to be numbered
#   end
#   result = data.join("<br>") # join array together into 1 string
#
#   # Display output
#   result
# end
