module API
  module Messages
    class AllInChat < Grape::API
      include Defaults

      authorize!

      MESSAGES_SIZE = 50

      params do
        requires :chat_id, type: Integer
      end

      get 'all_in_chat/:chat_id' do
        chat = Chat.find_by(params[:chat_id])

        raise 'Chat not found!' unless chat
        raise 'Forbidden' unless Chat.users.include?(@user)

        Message.last(MESSAGES_SIZE).order(:updated_at)
      rescue => error
        error!(error, 400)
      end
    end
  end
end