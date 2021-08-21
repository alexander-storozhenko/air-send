module API
  module Users
    class SignIn < Grape::API
      include Defaults

      params do
        requires :email, type: String
        requires :password, type: String
      end

      post 'sign_in' do
        user = User.find_by(email: params[:email])

        raise 'Incorrect login or password' if !user || !user.valid_password?(params[:password])

        session[:current_user] = user

        present access_token: user.jwt
      rescue => error
        error!(error, 400)
      end
    end
  end
end