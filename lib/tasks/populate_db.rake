namespace 'dbpop' do

  desc "Populates the races table"
  task :races => :environment do
    Race.new(:name => "Human", :description => "Just plain jane vanilla humans").save
    Race.new(:name => "Elf", :description => "Pointy ears and really, *really* like trees.").save
    Race.new(:name => "Dwarf", :description => "Short and beardy!").save
    Race.new(:name => "Orc", :description => "Big.  Green.  Strong.  Fugly.").save
  end

  desc "Populates the traits table"
  task :traits => :environment do
    races = Race.find(:all)
    num_races = races.size
    num_universals = 14

    universals = []
    1.upto(num_universals) do |i|
      t = Trait.new(:name => "Universal trait #{i.to_s}")
      t.save
      universals << t
    end

    traits_per_race = 32
    while (race = races.shift) do
      universals.each do |t|
        t.races << race
        t.save
      end

      1.upto(33 - num_universals - num_races) do |i|
        t = Trait.new(:name => "#{race.name} trait #{i.to_s}")
        t.races << race
        t.save
      end
      races.each do |cross_race|
        t = Trait.new(:name => "#{race.name}/#{cross_race.name} trait")
        t.races = [race, cross_race]
        t.save
      end
    end

  end
end
