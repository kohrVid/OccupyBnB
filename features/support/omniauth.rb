Before("@omniauth") do
  OmniAuth.config.test_mode = true
  Capybara.default_host = "http://127.0.0.1/"
  
  OmniAuth.config.add_mock(:twitter, {
    uid: "3244752237",
    info: {
    name: Faker::Internet.user_name
    }
  })
end
