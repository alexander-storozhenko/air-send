module API
  module Contents
    class AllInFolder < Grape::API
      include Defaults

      # authorize!

      MESSAGES_SIZE = 50

      params do
        requires :folder_name, type: String
      end

      get 'all_in_folder/:folder_name' do
        folder = User.first.folders.find_by(name: params[:folder_name])

        raise 'Folder not found!' unless folder
        # raise 'Forbidden' unless Folder.users.include?(@user)

        folder.contents.order(:updated_at)
      rescue => error
        error!(error, 400)
      end
    end
  end
end