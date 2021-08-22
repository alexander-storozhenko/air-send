require_relative 'send'

module API
  module Messages
    class Root < Grape::API
      namespace 'messages' do
        mount Send
      end
    end
  end
end