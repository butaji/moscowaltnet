# == Schema Information
# Schema version: 20110328210907
#
# Table name: speeches
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  title      :string(255)
#  body       :text
#  approved   :boolean
#  voices     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Speech < ActiveRecord::Base
  belongs_to :user

  def user
    logger.debug { "================== speech.user, id: " + user_id.to_s }
    return User.find(user_id)
  end

  def voted?(voter)
    Voice.where(:user_id => voter.id, :speech_id => self.id).any?
  end

  def votable?(voter)
    user == voter ? false : true
  end
end
