module API
  module Chat
    class Create < Grape::API
      include Defaults

      authorize!

      params do
        requires :name, type: String
        optional :with_user_id, type: Integer
      end

      post do
        users = [@user]
        users << with_user if params[:with_user] && (with_user = User.find_by(id: params[:with_user_id])) && with_user
        
        Chat.create!(name: params[:name], users: users)

        ''
      rescue => error
        error!(error, 400)
      end
    end
  end
end