require 'sinatra'

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

# Better version using views/templates
get '/' do
  # Read file
  file = File.open("cake.list")
  data = file.readlines
  file.close

  # Create view
  erb :index, :locals => {:cake_list => data}
end
