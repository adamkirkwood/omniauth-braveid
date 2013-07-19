require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class BraveId < OmniAuth::Strategies::OAuth2

      DEFAULT_PROVIDER_URL = 'https://brave-id.herokuapp.com'
      STRATEGY_NAME = 'brave_id'

      option :name, :brave_id
      option :client_options, {
        :site =>  DEFAULT_PROVIDER_URL,
        :authorize_url => "#{DEFAULT_PROVIDER_URL}/oauth/authorize",
        :access_token_url => "#{DEFAULT_PROVIDER_URL}/oauth/token"
      }

      protected
      def request_phase
        options[:scope] ||= 'basic'
        options[:response_type] ||= 'code'
        super
      end

      uid {
        raw_info['uid']
      }

      info do
        {
          :email => raw_info['email'],
          :pilots => raw_info['pilots']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end
      
      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = "access_token"
        @raw_info ||= MultiJson.decode(access_token.get('/oauth/user').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

    end
  end
end