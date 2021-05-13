class CustomFailure < Devise::FailureApp
  include Response

  def respond
    if http_auth?
      http_auth
    else
      self.status = 401
      response.set_header('Access-Control-Allow-Origin', '*')
      response.set_header('Access-Control-Allow-Methods', 'POST, PUT, DELETE, GET, OPTIONS')
      response.set_header('Access-Control-Request-Method', '*')
      response.set_header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization')
      self.content_type = 'json'
      self.response_body = {"errors" => ["Invalid login credentials"]}.to_json
    end
  end

end