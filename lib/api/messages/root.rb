require_relative 'send'
require_relative 'all_in_chat'

module API
  module Messages
    class Root < Grape::API
      namespace 'messages' do
        mount Send
        mount AllInChat
      end
    end
  end
end