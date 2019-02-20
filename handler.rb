require 'json'

def hello(event:, context:)
  begin
    puts "Received Request: #{event}"

   { statusCode: 200, body: JSON.generate("API V3: #{event['body']}") }
  rescue StandardError => e
    { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
  end
end