module API
  module Defaults
    extend ActiveSupport::Concern

    included do
      def self.authorize!(role: :sub_admin)
        before do
          authenticated =
            case role
            when :sub_admin
              p '1111'
              self.authenticated
            when :admin
              self.authenticated_admin
            end

          @user = User.new(role: :guest) unless authenticated

          error!("403 Forbidden", 403) unless authenticated
        end
      end

      def self.only_development!
        before do
          error!("403 Forbidden", 403) unless %w[development test].include? ENV['RAILS_ENV']
        end
      end
    end
  end
end