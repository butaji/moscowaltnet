class SpeechesController < ApplicationController
  respond_to :html, :json

  def new
    @speech = Speech.new
    respond_with(@speech)
  end

  def index
    respond_with(@speeches = Speech.all)
  end

  def show
    respond_with(@speech = Speech.find(params[:id]))
  end

  def create
    @speech = Speech.new(params[:speech])
    if @speech.save
      redirect_to(@speech)
    else
      redirect_to(:action => "new")
    end
  end

  def approve
  end

  def vote
  end

  def edit
    respond_with(@speech = Speech.find(params[:id]))
  end

  def update
    @speech = Speech.find(params[:id])
    if @speech.update_attributes(params[:speech])
      redirect_to(@speech)
    else
      redirect_to(:action => "edit", :id => params[:id])
    end
  end  


end
