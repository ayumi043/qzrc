class Identity < OmniAuth::Identity::Models::ActiveRecord
  attr_accessible :email, :nickname, :password_digest, 
                  :password, :password_confirmation

  validates :nickname, 
            :uniqueness => true, 
            :presence => true

  validates :email, 
            :uniqueness => true, 
            :presence => true, 
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
