require_relative 'defaults'
require_relative 'api_helper'

require_relative 'chat/root'
require_relative 'users/root'
require_relative 'messages/root'

module API
  class API < Grape::API
    helpers ApiHelper

    format :json

    namespace 'api' do
      namespace 'v1' do
        mount Chat::Root
        mount Messages::Root
        mount Users::Root
      end
    end
  end
end