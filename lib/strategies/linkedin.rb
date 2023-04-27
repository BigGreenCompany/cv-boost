# https://github.com/decioferreira/omniauth-linkedin-oauth2/issues/70#issuecomment-1484556262
module OmniAuth
  module Strategies
    class LinkedIn < OmniAuth::Strategies::OAuth2
      def token_params
        super.tap do |params|
          params.client_secret = options.client_secret
        end
      end
    end
  end
end
