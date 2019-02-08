module ExceptionHandler
  extend ActiveSupport::Concern

  class MissingToken < StandardError; end
  class UnprocessableEntity < StandardError; end

  included do
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two

    rescue_from Flexirest::HTTPClientException, Flexirest::HTTPServerException do |e|
      json_response({ message: e.result.respond_to?(:message) ? e.result.message : 'Unknown error' }, e.status)
    end

    rescue_from Flexirest::TimeoutException do
      json_response({ message: 'Server did not respond on time.' }, 504)
    end
  end

  private

  # respond with json unprocessable_entity message
  def four_twenty_two(exc)
    json_response({ message: exc.message }, :unprocessable_entity)
  end
end
