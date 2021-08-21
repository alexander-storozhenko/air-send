require 'auth'

module API
  module ApiHelper
    include Auth

    def warden
      env['warden']
    end

    def session
      env['rack.session']
    end

    def authenticated
      return true if warden.authenticated?
      return if headers['Access-Token'].blank?

      payload = decode_jwt(headers['Access-Token'])&.first
      return unless payload

      p payload, @user = User.find_by(id: payload['id'])
      p @user.role
      (@user = User.find_by(id: payload['id'])) && (@user.sub_admin? || @user.admin?)
    end

    def authenticated_admin
      authenticated && @user.admin?
    end

    def current_user
      warden.user || @user
    end
  end
end