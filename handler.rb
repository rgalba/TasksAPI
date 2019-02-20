require 'json'

def hello(event:, context:)
  begin
    puts "Received Request: #{event}"

   { statusCode: 200, body: JSON.generate("API V2: #{event['body']}") }
  rescue StandardError => e
    puts e.message
    puts e.backtrace.inspect
    { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
  end
end