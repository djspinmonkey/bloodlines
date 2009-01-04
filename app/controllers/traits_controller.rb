class TraitsController < ApplicationController
  # GET /traits
  # GET /traits.xml
  def index
    @traits = Trait.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @traits }
    end
  end

  # GET /traits/1
  # GET /traits/1.xml
  def show
    @trait = Trait.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trait }
    end
  end

  # GET /traits/new
  # GET /traits/new.xml
  def new
    @trait = Trait.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trait }
    end
  end

  # GET /traits/1/edit
  def edit
    @trait = Trait.find(params[:id])
  end

  # POST /traits
  # POST /traits.xml
  def create
    @trait = Trait.new(params[:trait])

    respond_to do |format|
      if @trait.save
        flash[:notice] = 'Trait was successfully created.'
        format.html { redirect_to(@trait) }
        format.xml  { render :xml => @trait, :status => :created, :location => @trait }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trait.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /traits/1
  # PUT /traits/1.xml
  def update
    @trait = Trait.find(params[:id])

    respond_to do |format|
      if @trait.update_attributes(params[:trait])
        flash[:notice] = 'Trait was successfully updated.'
        format.html { redirect_to(@trait) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trait.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /traits/1
  # DELETE /traits/1.xml
  def destroy
    @trait = Trait.find(params[:id])
    @trait.destroy

    respond_to do |format|
      format.html { redirect_to(traits_url) }
      format.xml  { head :ok }
    end
  end
end
