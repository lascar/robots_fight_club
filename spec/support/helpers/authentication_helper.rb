module AuthenticationHelper
  def auth_header_for(user)
    {
      'Accept' => Mime::JSON,
      'Content-Type' => Mime::JSON.to_s,
      'X-User-Email' => user.email,
      'X-User-Token' => user.authentication_token,
    }
  end

  def auth_header_multipart_for(user)
    {
      'Content-Type' => 'multipart/form-data',
      'X-User-Email' => user.email,
      'X-User-Token' => user.authentication_token,
    }
  end

  def authenticate_headers(headers)
    user = FactoryGirl.create(:user) 
    headers['Accept'] = Mime::JSON
    headers['Content-Type'] = Mime::JSON.to_s
    headers['X-User-Email'] = user.email
    headers['X-User-Token'] = user.authentication_token
  end
end
