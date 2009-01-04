class MarriagesController < ApplicationController
  # GET /marriages
  # GET /marriages.xml
  def index
    @marriages = Marriage.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @marriages }
    end
  end

  # GET /marriages/1
  # GET /marriages/1.xml
  def show
    @marriage = Marriage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @marriage }
    end
  end

  # GET /marriages/new
  # GET /marriages/new.xml
  def new
    @marriage = Marriage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @marriage }
    end
  end

  # GET /marriages/1/edit
  def edit
    @marriage = Marriage.find(params[:id])
  end

  # POST /marriages
  # POST /marriages.xml
  def create
    @marriage = Marriage.new(params[:marriage])

    respond_to do |format|
      if @marriage.save
        flash[:notice] = 'Marriage was successfully created.'
        format.html { redirect_to(@marriage) }
        format.xml  { render :xml => @marriage, :status => :created, :location => @marriage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @marriage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /marriages/1
  # PUT /marriages/1.xml
  def update
    @marriage = Marriage.find(params[:id])

    respond_to do |format|
      if @marriage.update_attributes(params[:marriage])
        flash[:notice] = 'Marriage was successfully updated.'
        format.html { redirect_to(@marriage) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @marriage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /marriages/1
  # DELETE /marriages/1.xml
  def destroy
    @marriage = Marriage.find(params[:id])
    @marriage.destroy

    respond_to do |format|
      format.html { redirect_to(marriages_url) }
      format.xml  { head :ok }
    end
  end
end
