require_relative 'send'
require_relative 'all_in_folder'

module API
  module Contents
    class Root < Grape::API
      namespace 'contents' do
        mount Send
        mount AllInFolder
      end
    end
  end
end