class CharactersController < ApplicationController
  layout 'toolish'

  # GET /characters
  # GET /characters.xml
  def index
    @characters = Character.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.xml
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js   # show.js.rjs
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    @character = Character.new
    @houses = House.find(:all)
    @races = Race.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
    @houses = House.find(:all)
  end

  # POST /characters
  # POST /characters.xml
  def create
    @character = Character.new(params[:character])
    @allow_marriage = true
    @allow_offspring = true
    @unmarried_present = true
    @marriages_present = true
    @generic_present = false

    respond_to do |format|
      if @character.save
        format.html { redirect_to(@character) }
        format.js   { render :action => "redraw" }
        format.xml  { render :xml => @character, :status => :created, :location => @character }
      else
        format.html { render :action => "new" }
        format.js   { render :action => "redraw" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.xml
  def update
    @character = Character.find(params[:id])
    @allow_marriage = true
    @allow_offspring = true
    @unmarried_present = true
    @marriages_present = true
    @generic_present = false

    respond_to do |format|
      if @character.update_attributes(params[:character])
        flash[:notice] = 'Character was successfully updated.'
        format.html { redirect_to(@character) }
        format.js   { render :action => "redraw" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.js   { render :action => "redraw" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.xml
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end
end
