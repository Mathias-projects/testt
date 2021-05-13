class CustomFailure < Devise::FailureApp
  include Response

  def respond
    if http_auth?
      http_auth
    else
      self.status = 401
      self.content_type = 'json'
      self.response_body = {"errors" => ["Invalid login credentials"]}.to_json
    end
  end

end