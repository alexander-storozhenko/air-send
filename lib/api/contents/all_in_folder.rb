module API
  module Contents
    class AllInFolder < Grape::API
      include Defaults

      # authorize!

      MESSAGES_SIZE = 50

      params do
        requires :folder_id, type: Integer
      end

      get 'all_in_folder/:chat_id' do
        chat = Folder.find_by(params[:folder_id])

        raise 'Folder not found!' unless chat
        raise 'Forbidden' unless Folder.users.include?(@user)

        Content.last(MESSAGES_SIZE).order(:updated_at)
      rescue => error
        error!(error, 400)
      end
    end
  end
end