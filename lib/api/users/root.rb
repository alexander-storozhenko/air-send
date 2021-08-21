require_relative 'sign_in'
require_relative 'sign_up'

module API
  module Users
    class Root < Grape::API
      namespace 'users' do
        mount SignUp
        mount SignIn
      end
    end
  end
end