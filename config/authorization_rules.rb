authorization do
  role :admin do
    includes :user
    has_permission_on :speeches, :to => [:index, :edit, :update, :destroy]
  end

  role :moderator do
    # to future
  end

  role :news_maker do
    # to future
  end

  role :user do
    includes :guest
    has_permission_on :speeches, :to => [:show, :new, :create, :vote_up, :vote_down]
    has_permission_on :speeches, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
#    more convenient way but required fix js code to show useful information
#    has_permission_on :speeches, :to => [:vote_up, :vote_down] do
#      if_attribute :user => is_not {user}
#    end
  end

  role :guest do
    has_permission_on [:speeches], :to => [:show]
  end
end