require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class BraveId < OmniAuth::Strategies::OAuth2

      DEFAULT_PROVIDER_URL = 'http://localhost:3000'
      STRATEGY_NAME = 'brave_id'

      client_options = {
        :site =>  DEFAULT_PROVIDER_URL,
        :authorize_url => "#{DEFAULT_PROVIDER_URL}/oauth/#{STRATEGY_NAME}/authorize",
        :access_token_url => "#{DEFAULT_PROVIDER_URL}/oauth/#{STRATEGY_NAME}/access_token"
      }

      protected

      def user_data
        @data ||= MultiJson.decode(@access_token.get("/auth/user"))
      end

      def request_phase
        options[:scope] ||= 'basic'
        options[:response_type] ||= 'code'
        super
      end

      def user_hash
        user_data
      end

      def raw_info
        @data ||= access_token.params["user"]
        unless @data
          access_token.options[:mode] = :query
          access_token.options[:param_name] = "access_token"
          @data ||= access_token.get('/oauth/user').parsed || {}
        end
        @data
      end

    end
  end
end