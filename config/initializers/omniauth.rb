OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '544561166451-5iujcqn08t9mn93qle6efsiasvqc2sj9.apps.googleusercontent.com', 'koDh-XRJMiw0BdVEkALxrzf2', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
