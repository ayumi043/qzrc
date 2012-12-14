class User < ActiveRecord::Base
  attr_accessible :nickname, :email, :authentications_attributes, :created_at, :updated_at

  has_many :authentications
  validates :nickname, :presence => true
  validates :email, :uniqueness => true#, :presence => true, 

  accepts_nested_attributes_for :authentications

  def add_auth(auth)
    authentications.create(:provider => auth[:provider],
                           :uid => auth[:uid])
  end

  #类方法
  class << self
    def from_auth(auth)
      
      nickname = auth[:info][:nickname] if auth[:provider] == 'github'
      nickname = auth[:info][:name] if auth[:provider] == 'douban'
      if auth[:provider] == 'identity'
        user = Identity.find_by_email(auth[:info][:email])
        binding.pry
        if user
          nickname = user.nickname
        else

        end  
      end  

      #豆瓣有的账号传回来可能没有包含email

      locate_auth(auth) || locate_email || create_auth(auth)
        
    end

    def locate_auth(auth)
      Authentication.find_by_provider_and_uid(auth[:provider], auth[:uid]).try(:user)
    end

    def locate_email(auth)
      user = find_by_email(auth[:info][:email])
      return unless user
      user.add_auth(auth)
      user
    end

    def create_auth(auth)
      create!(
          :nickname => nickname,
          :email => auth[:info][:email],
          :authentications_attributes => [Authentication.new(:provider => auth[:provider],
                                                             :uid => auth[:uid]).attributes]
      )
    end

  end

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
