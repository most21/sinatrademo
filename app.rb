require 'sinatra'


get '/' do
  # # Read data from file
  # file = File.open("cake.list")
  # data = file.readlines
  # file.close
  #
  # # Build an output string in the form of a numbered list
  # for i in 0..data.length-1
  #   data[i] = "#{i + 1}. #{data[i]}" # modify each element to be numbered
  # end
  # result = data.join("<br>") # join array together into 1 string
  #
  # # Display output
  # result
  "Hello, world"
end
