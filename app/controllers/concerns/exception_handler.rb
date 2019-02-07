module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Flexirest::HTTPClientException, Flexirest::HTTPServerException do |e|
      json_response({ message: e.result.message }, e.status)
    end
  end
end
