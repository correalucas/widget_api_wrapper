class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  # Service entry point - return valid user object
  def call
    {
      bearer_token: http_auth_header
    }
  end

  private

  attr_reader :headers

  # check for token in `Authorization` header
  def http_auth_header
    return headers['Authorization'] if headers['Authorization'].present?
    raise(ExceptionHandler::MissingToken, 'Missing token')
  end
end
