class VotesController < ApplicationController
  # GET /votes
  # GET /votes.xml
  def index
    @votes = Vote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @votes }
    end
  end

  # GET /votes/1
  # GET /votes/1.xml
  def show
    @vote = Vote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  # GET /votes/1/edit
  def edit
    @vote = Vote.find(params[:id])
  end

  # POST /votes
  # POST /votes.xml
  def create
    @link = Link.find(params[:id])
    
    unless voted?(@link)
      @vote = current_user.votes.build(:link_id => @link.id, :value => 1)
      respond_to do |format|
        if @vote.save
          format.html { redirect_to(root_path, :notice => 'Vote was successfully created.') }
          format.xml  { render :xml => @vote, :status => :created, :location => @vote }
        else
          format.html { redirect_to(root_path, :notice => 'Invalid vote') }
          format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to(root_path, :notice => 'Vote already exists.') }
      end
    end  
  end

  # PUT /votes/1
  # PUT /votes/1.xml
  def update
    @vote = Vote.find(params[:id])

    respond_to do |format|
      if @vote.update_attributes(params[:vote])
        format.html { redirect_to(@vote, :notice => 'Vote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
      end
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
end
