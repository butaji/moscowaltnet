# == Schema Information
# Schema version: 20110328210907
#
# Table name: voices
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  speech_id  :integer
#  value      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Voice < ActiveRecord::Base
  belongs_to :user
  belongs_to :speech

  def self.up(user, speech)
    self.vote(user, speech, 1)
  end

  def self.down(user, speech)
    self.vote(user, speech, -1)
  end

  def self.vote(user, speech, value)
    @voice = Voice.new
    @voice.user_id = user.id
    @voice.value = value
    @voice.speech_id = speech.id
    @voice.save
    
    speech.voices += value
    speech.save
    
    return @voice    
  end
end
