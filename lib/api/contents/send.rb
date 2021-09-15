module API
  module Contents
    class Send < Grape::API
      include Defaults

      helpers FileAPI

      authorize!

      MAX_FILE_SIZE = 200.freeze

      params do
        requires :text, type: String
        optional :file, type: File
      end

      post do
        content_type 'multipart/form-data'
        file = params[:file]
        text = params[:text]

        folder = @user.folders.find_by(name: 'default')

        message = Content.create!(text: text, sender: @user, folders: [folder])
        message.file = attachment(file)

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end