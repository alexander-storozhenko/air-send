require_relative 'create'
module API
  module Chat
    class Root < Grape::API
      namespace 'chat' do
        mount Create
      end
    end
  end
end