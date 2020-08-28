class ApplicationController < ActionController::API
    def token
        authorization.split(" ")[1] if authorization
    end

    def authorization
        @authorization ||= request.authorization
    end

    def secret
        ENV['jwt_secret']
    end

    def decoded_token
        JWT.decode(token, secret, true, { algorithm: 'HS256' })
    end

    def current_user
        @current_user ||= User.find(decoded_token[0]["id"]) if authorization
    end

    def create_token(id, name, username, email, pic = nil)
        payload = { id: id, name: name, username: username, email: email, profile_pic: pic }
        JWT.encode(payload, secret, 'HS256')
    end
end