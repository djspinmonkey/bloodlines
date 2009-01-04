class CharacterRacesController < ApplicationController
  # GET /character_races
  # GET /character_races.xml
  def index
    @character_races = CharacterRace.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @character_races }
    end
  end

  # GET /character_races/1
  # GET /character_races/1.xml
  def show
    @character_race = CharacterRace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character_race }
    end
  end

  # GET /character_races/new
  # GET /character_races/new.xml
  def new
    @character_race = CharacterRace.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character_race }
    end
  end

  # GET /character_races/1/edit
  def edit
    @character_race = CharacterRace.find(params[:id])
  end

  # POST /character_races
  # POST /character_races.xml
  def create
    @character_race = CharacterRace.new(params[:character_race])

    respond_to do |format|
      if @character_race.save
        flash[:notice] = 'CharacterRace was successfully created.'
        format.html { redirect_to(@character_race) }
        format.xml  { render :xml => @character_race, :status => :created, :location => @character_race }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /character_races/1
  # PUT /character_races/1.xml
  def update
    @character_race = CharacterRace.find(params[:id])

    respond_to do |format|
      if @character_race.update_attributes(params[:character_race])
        flash[:notice] = 'CharacterRace was successfully updated.'
        format.html { redirect_to(@character_race) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @character_race.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /character_races/1
  # DELETE /character_races/1.xml
  def destroy
    @character_race = CharacterRace.find(params[:id])
    @character_race.destroy

    respond_to do |format|
      format.html { redirect_to(character_races_url) }
      format.xml  { head :ok }
    end
  end
end
