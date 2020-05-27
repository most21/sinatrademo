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
get '/:id' do
  data = Cake.find(params[:id]) # query database for specific cake id
  data.name # display cake name
end

# Add a cake to the database
# post '/:type' do
#   c = Cake.create(name: params[:type]) # create and save new row to db table
#   #params[:type] + " was successfully added to the database"
#   erb :add_cake
#
# end




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
