class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :authentications_attributes, :created_at, :updated_at
  belongs_to :user
  
  validates :provider, :presence => true, :uniqueness => {:scope => :user_id}

  validates_uniqueness_of :uid, :scope => :provider  #相同provider的uid必须唯一
  validates_presence_of :uid, :on => :create, :message => "can't be blank"
end
