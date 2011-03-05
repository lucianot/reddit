class VotesController < ApplicationController
  before_filter :authorize_admin!, :except => [:up, :down, :remove]
  
  # GET /votes
  # GET /votes.xml
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.xml
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to(votes_url) }
      format.xml  { head :ok }
    end
  end
  
  def up
    @link = Link.find(params[:id])
    unless voted?(@link)
      @link.upvote(current_user)
      redirect_to(root_path, :notice => 'Vote was successfully created.')
    else
      redirect_to(root_path, :notice => 'Vote already exists.')
    end
  end
  
  def down
    @link = Link.find(params[:id])
    unless voted?(@link)
      @link.downvote(current_user)
      redirect_to(root_path, :notice => 'Vote was successfully created.')
    else
      redirect_to(root_path, :notice => 'Vote already exists.')
    end
  end
  
  def remove
    @link = Link.find(params[:id])
    @link.remove_vote(current_user)
    redirect_to(root_path, :notice => 'Vote was successfully removed.')
  end
end
