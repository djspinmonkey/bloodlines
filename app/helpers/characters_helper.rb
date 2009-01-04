module CharactersHelper
  def spouse_link (character)
    if character.married?
      return link_to_remote( h(character.spouse.name), :url => character_url(character.spouse), :method => :get )
    else
      return 'none'
    end
  end
end
