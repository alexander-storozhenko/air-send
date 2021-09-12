module API
  module Contents
    class Send < Grape::API
      include Defaults

      helpers FileAPI

      # authorize!

      MAX_FILE_SIZE = 200.freeze

      params do
        requires :text, type: String
        requires :to_chats, type: Integer
        optional :file, type: File
      end

      post do
        content_type 'multipart/form-data'
        file = params[:file]
        text = params[:text]

        chats = ::Folder.where(id: params[:to_chats])

        message = Content.create!(content: text, sender: User.first, chats: chats)
        message.file = attachment(file)

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end