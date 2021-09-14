module API
  module Folders
    class Index < Grape::API
      include Defaults

      authorize!

      params do
      end

      get do
        @user.folders
      rescue => error
        error!(error, 400)
      end
    end
  end
end