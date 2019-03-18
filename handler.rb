require 'json'

def hello(event:, context:)
  begin
    puts "Received Request: #{event}"

    raise "brand new bug" if true

    body = {
      version: "V1.0.3",
      payload: "Hello API."
    }
   { statusCode: 200, body: JSON.generate(body) }
  rescue StandardError => e
    { statusCode: 400, body: JSON.generate("Bad request, please POST a request body!") }
  end
end