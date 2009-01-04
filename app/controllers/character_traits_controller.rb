class CharacterTraitsController < ApplicationController
  # GET /character_traits
  # GET /character_traits.xml
  def index
    @character_traits = CharacterTrait.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @character_traits }
    end
  end

  # GET /character_traits/1
  # GET /character_traits/1.xml
  def show
    @character_trait = CharacterTrait.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character_trait }
    end
  end

  # GET /character_traits/new
  # GET /character_traits/new.xml
  def new
    @character_trait = CharacterTrait.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character_trait }
    end
  end

  # GET /character_traits/1/edit
  def edit
    @character_trait = CharacterTrait.find(params[:id])
  end

  # POST /character_traits
  # POST /character_traits.xml
  def create
    @character_trait = CharacterTrait.new(params[:character_trait])

    respond_to do |format|
      if @character_trait.save
        flash[:notice] = 'CharacterTrait was successfully created.'
        format.html { redirect_to(@character_trait) }
        format.xml  { render :xml => @character_trait, :status => :created, :location => @character_trait }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character_trait.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /character_traits/1
  # PUT /character_traits/1.xml
  def update
    @character_trait = CharacterTrait.find(params[:id])

    respond_to do |format|
      if @character_trait.update_attributes(params[:character_trait])
        flash[:notice] = 'CharacterTrait was successfully updated.'
        format.html { redirect_to(@character_trait) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @character_trait.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /character_traits/1
  # DELETE /character_traits/1.xml
  def destroy
    @character_trait = CharacterTrait.find(params[:id])
    @character_trait.destroy

    respond_to do |format|
      format.html { redirect_to(character_traits_url) }
      format.xml  { head :ok }
    end
  end
end
