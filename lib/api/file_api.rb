module API
  module FileAPI
    extend Grape::API::Helpers

    def attachment(file)
      attach = {
        filename: file[:filename],
        type: file[:type],
        headers: file[:head],
        tempfile: file[:tempfile]
      }

      ActionDispatch::Http::UploadedFile.new(attach)
    end
  end
end