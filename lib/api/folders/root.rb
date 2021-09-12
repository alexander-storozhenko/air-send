require_relative 'create'

module API
  module Folders
    class Root < Grape::API
      namespace 'folder' do
        mount Create
      end
    end
  end
end