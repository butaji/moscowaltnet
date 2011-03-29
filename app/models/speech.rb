class Speech < ActiveRecord::Base
  belongs_to :user

  def user
    logger.debug { "================== speech.user, id: " + user_id.to_s }
    return User.find(user_id)
  end
end
