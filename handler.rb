require 'json'

def hello(event:, context:)
  begin
    raise unless event
    puts "Received Request: #{event}"

    body = {
      version: "V1.0.4",
      payload: "Hello API."
    }
   { statusCode: 200, body: JSON.generate(body) }
  rescue StandardError => e
    { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
  end
end