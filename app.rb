require 'sinatra'
require 'sinatra/json'
require 'pg'
require 'sinatra/activerecord'

# Next version using a PostgreSQL database
class Cake < ActiveRecord::Base
end

# Read all rows
get '/' do
  data = Cake.all # query database for all rows in the cakes table
  erb :index, :locals => {:cake_list => data}
end

# Read a single row
get '/read/:id' do
  # Query database and display
  data = Cake.find_by(id: params[:id])
  data.name # display cake name
end

# Add a cake to the database
get '/add_cake' do # this route displays the input form
  erb :add_cake
end

post '/add_cake' do # this route processes the input
  c = Cake.create(name: params["name"]) # create and save new row to db table
  #params["name"] + " was successfully added to the database"
  redirect '/'
end

# Update an existing cake in the database
get '/edit_cake' do
  erb :edit_cake
end

post '/edit_cake' do
  c = Cake.find_by(id: params["id"]) # find existing row
  old_name = c.name
  c.update(name: params["name"]) # update cake name
  #params["id"] + " " + old_name + " was successfully edited to " + params["name"]
  redirect '/'
end

# Delete an existing cake in the database
get '/delete_cake' do
  erb :delete_cake
end

post '/delete_cake' do
  Cake.find(params[:id]).destroy # find and destroy (eat?) the cake
  #params[:id] + " was successfully deleted"
  redirect '/'
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
