class Voice < ActiveRecord::Base
  belongs_to :user
  belongs_to :speech
end
