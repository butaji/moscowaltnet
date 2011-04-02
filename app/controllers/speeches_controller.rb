class SpeechesController < ApplicationController
  respond_to :html, :json
#  before_filter :authorize, :except => :show
  filter_resource_access

  def new
    @speech = Speech.new
    respond_with(@speech)
  end

  def index
    respond_with(@speeches = Speech.where(:user_id => current_user.id))
  end

  def show
    respond_with(@speech = Speech.find(params[:id]))
  end

  def create
    @speech = Speech.new(params[:speech])
    @speech.user_id = current_user.id
    @speech.approved = false
    @speech.voices = 0
    if @speech.save
      redirect_to(@speech)
    else
      redirect_to(:action => "new")
    end
  end

  def approve
  end

  def vote_up
    speech = Speech.find(params[:id])
    unless (speech.votable?(current_user))
      respond_with(:message => "You can't vote for yours own posts")
      return
    end

    if (speech.voted?(current_user))
      respond_with(:message => "You've already voted for this post")
      return
    end

    @voice = Voice.up(current_user, speech)
    respond_with(:voices => speech.voices)
  end

  def vote_down
    speech = Speech.find(params[:id])
    unless (speech.votable?(current_user))
      respond_with(:message => "You can't vote for yours own posts")
      return
    end

    if (speech.voted?(current_user))
      respond_with(:message => "You've already voted for this post")
      return
    end

    @voice = Voice.down(current_user, speech)
    respond_with(speech.voices)
  end

  def edit
    @speech = Speech.find(params[:id])
    # check 20 times :user permissions (just in case) and delete this conditions
    if (@speech.user_id != current_user.id)
      redirect_to(:controller => "help", :action => "speakers")
      return
    end

    respond_with(@speech = Speech.find(params[:id]))
  end

  def update
    @speech = Speech.find(params[:id])

    if (@speech.user_id != current_user.id)
      redirect_to(:controller => "help", :action => "speakers")
      return
    end


    if @speech.update_attributes(params[:speech])
      redirect_to(@speech)
    else
      redirect_to(:action => "edit", :id => params[:id])
    end
  end  
end
