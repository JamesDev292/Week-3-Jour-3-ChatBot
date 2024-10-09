require 'http'
require 'json'
require 'dotenv'

Dotenv.load

api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/completions"

headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}

loop do

print "> "
text = gets.chomp

    data = {
    "prompt" => text,
    "max_tokens" => 25,
    "temperature" => 0,
    "n" => 1,
    "model" => "gpt-3.5-turbo-instruct",
    }

    response = HTTP.post(url, headers: headers, body: data.to_json)
    response_body = JSON.parse(response.body.to_s)
    response_string = response_body['choices'][0]['text'].strip

break if text == "exit"

print "Rick: "
puts response_string

end
