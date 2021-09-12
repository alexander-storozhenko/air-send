require_relative 'defaults'
require_relative 'api_helper'
require_relative 'file_api'

require_relative 'folders/root'
require_relative 'users/root'
require_relative 'contents/root'

module API
  class API < Grape::API
    helpers ApiHelper

    format :json

    namespace 'api' do
      namespace 'v1' do
        mount Folders::Root
        mount Contents::Root
        mount Users::Root
      end
    end
  end
end