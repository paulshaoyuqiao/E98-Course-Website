OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "88188924870-dqrdrbns9s3b11msakh8ri68l6taku51.apps.googleusercontent.com", "1zeGBI26S3tlLEGdEh6Fr0Ex", {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end