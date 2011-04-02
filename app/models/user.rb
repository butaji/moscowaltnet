# == Schema Information
# Schema version: 20110328210907
#
# Table name: users
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
#  using_access_control
  typed_serialize :roles, Array
  has_many :speech


  def role_symbols
    @role_symbols ||= (roles || []).map {|r| r.to_sym}
  end
  
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.email = auth["user_info"]["email"]
      user.roles = [:user]
    end
  end
  
end
