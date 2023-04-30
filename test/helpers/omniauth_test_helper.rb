module OmniauthTestHelper
  def mock_auth_hash(provider, user)
    OmniAuth.config.mock_auth[provider.to_sym] = OmniAuth::AuthHash.new({
      provider: provider.to_s,
      uid: user.uid,
      info: {
        email: user.email,
        first_name: user.first_name,
        last_name: user.last_name
      },
      credentials: {
        token: 'token',
        secret: 'secret'
      }
    })
  end
end
