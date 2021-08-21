module API
  module Users
    class SignUp < Grape::API
      include Defaults

      params do
        requires :email, type: String
        requires :password, type: String
      end

      post 'sign_up' do
        ::User.create!(email: params[:email], password: params[:password])

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end