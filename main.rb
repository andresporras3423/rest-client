require 'rest-client'
BASE_ADDR = 'http://www.bing.com'
loop do
  puts "insert word to search (or q to quit):"
  word = gets.chomp
  if word=='q'
    puts 'bye bye'
    break
  end
  response = RestClient.get(BASE_ADDR, { params: { q: word } })

  file = 'index.html'

  File.open(file, "w") do |file|
    file.write(response)
  end

  puts response.code
  puts response.headers
end