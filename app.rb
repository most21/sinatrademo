require 'sinatra'


get '/' do
  # Read data from file
  file = File.open("cake.list")
  data = file.readlines
  file.close

  # Build an output string in the form of a numbered list
  # result = ""
  # for i in 0..data.length-1
  #   result += "#{i + 1}. #{data[i]}<br>"
  # end

  for i in 0..data.length-1
    data[i] = "#{i + 1}. #{data[i]}"
  end
  result = data.join("<br>")


  # Display output
  result
end
