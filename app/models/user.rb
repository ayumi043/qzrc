class User < ActiveRecord::Base
  attr_accessible :nickname, :email, :authentications_attributes, :created_at, :updated_at

  has_many :authentications
  validates :nickname, :presence => true
  validates :email, :uniqueness => true#, :presence => true, 

  accepts_nested_attributes_for :authentications

  #类方法
  class << self
    def from_auth(auth)

      nickname = auth[:info][:nickname] if auth[:provider] == 'github'
      nickname = auth[:info][:name] if auth[:provider] == 'douban'

      #豆瓣有的账号传回来可能没有包含email

      Authentication.find_by_provider_and_uid(auth[:provider], auth[:uid]).try(:user) ||
        create!(
          :nickname => nickname,
          :email => auth[:info][:email],
          :authentications_attributes => [Authentication.new(:provider => auth[:provider],
                                                             :uid => auth[:uid]).attributes]
        )
    end
  end

end
