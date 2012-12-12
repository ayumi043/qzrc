Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'd51ae2789a05830f27c3', '2297670b44806ac1c8867ff4679be3a48f7f3216'
  provider :douban, '0d5ecf05b228b09a281c6d11167a11ce', '247b1a0e2c841544'
  # provider :identity, :fields => [:nickname, :email], on_failed_registration: lambda { |env|    
  #   IdentitiesController.action(:new).call(env)
  # }
  provider :identity, :fields => [:nickname, :email], :on_failed_registration => IdentitiesController.action(:new)
end
