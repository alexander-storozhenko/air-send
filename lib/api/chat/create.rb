module API
  module Chat
    class Create < Grape::API

      format :json

      params do
        requires :name, type: String
      end

      post do
        ::Chat.create!(name: params[:name])

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end