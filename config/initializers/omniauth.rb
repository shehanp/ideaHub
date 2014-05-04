

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['629654867127771'], ENV['d97892d00644ca133b4bb1fed37da50b']
end
