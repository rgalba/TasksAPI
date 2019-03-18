require 'json'

def hello(event:, context:)
  begin
    puts "Received Request: #{event}"

    body = {
      version: "API V1",
      event: event,
      context: context
    }
   { statusCode: 200, body: JSON.generate(body) }
  rescue StandardError => e
    { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
  end
end