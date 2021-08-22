module API
  module Messages
    class Send < Grape::API
      include Defaults

      authorize!

      params do
        requires :content, type: String
        requires :to_chats, type: Array[Integer]
      end

      post do
        Message.create!(content: params[:content], sender: @user, chats: params[:to_chats])

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end