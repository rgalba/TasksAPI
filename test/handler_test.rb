require_relative '../handler.rb'
require 'test/unit'
require 'json'

class TestHandler < Test::Unit::TestCase
    def test_happy_path()
        response = hello(event: {'body': 'Hello, World!'}, context: {})
        expected = {
            version: "V1.0.4",
            payload: "Hello API."
        }
        assert_equal 200, response[:statusCode]
        assert_equal JSON.generate(expected), response[:body]
    end

    def test_sad_path()
        response = hello(event: nil, context: {})
        assert_equal 400, response[:statusCode]
        assert_match /please POST/, response[:body]
    end
end