require_relative 'chat/root'

module API
  class API < Grape::API
    namespace 'api' do
      namespace 'v1' do
        mount Chat::Root
      end
    end
  end
end