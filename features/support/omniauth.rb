Before("@omniauth") do
  OmniAuth.config.test_mode = true
  Capybara.default_host = "http://127.0.0.1/"
  
  OmniAuth.config.add_mock(:twitter, {
    uid: "3244752254",
    info: {
    name: Faker::Internet.user_name
    }
  })
  
  OmniAuth.config.add_mock(:facebook, {
    uid: "3244752254",
    info: {
    name: Faker::Internet.user_name
    }
  })
  
  OmniAuth.config.add_mock(:instagram, {
    uid: "3244752254",
    info: {
    name: Faker::Internet.user_name
    }
  })
end
