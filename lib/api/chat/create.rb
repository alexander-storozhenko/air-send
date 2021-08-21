module API
  module Chat
    class Create < Grape::API
      include Defaults

      authorize!

      params do
        requires :name, type: String
      end

      post do
        ::Chat.create!(name: params[:name], users: [@user])

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end