### CORE MODULE ###

class SorcerySchool
    @@spells = ['fireball', 'earthquake', 'wall of water', 'lightening bolt']

    def assign_artifact(role)
        case role
        when 'illusionist' then 'crystal ball'
        when 'enchanter' then 'crystal ball'
        when 'necromancer' then 'wooden staff'
        when 'conjurer' then 'silver wand'
        end
        
    end 
    
    def assign_spell
        return 'TBD' if @@spells == []
        spell = @@spells.sample
        @@spells.delete(spell)
        spell
    end 
    
    def assign_robe(role)
        case role
        when 'illusionist' then 'purple'
        when 'necromancer' then 'black'
        when 'enchanter' then 'gold'
        when 'conjurer' then 'green'
        end
    end
    
    private
    
     def calc_magic_energy(role)
        case role
        when 'enchanter' then (150..250).to_a.sample
        when 'necromancer' then (75..175).to_a.sample
        else
            (100..200).to_a.sample
        end
    end
end 


### UNIQUE MAGIC ABILITIES ###

module IllusionSpells
    def mirage
    end 
end 

module Necromancy
    def make_zombie
    end 
end

module TimeMagic
    def time_stop
    end 
end 

### STDUENT OBJECT ###


class Student < SorcerySchool
    def initialize
    end
    
    def to_s
    p "==============================="
       p "School of Socery: #{@name.capitalize}"
       p "Magical Energy: #{@energy}"
       p "Unique Spell: #{@spell}"
       p "Artifact: #{@artifact}"
       p "Robe color: #{@robe}"
    p "==============================="
    end
end

class Conjurer < Student
    include IllusionSpells
    include TimeMagic
    attr_reader :name
    def initialize
        @name = 'conjurer'
        @energy = calc_magic_energy(@name)
        @robe = assign_robe(@name)
        @spell = assign_spell
        @artifact = assign_artifact(@name)
    end
    
    private
    
    attr_reader :energy, :robe, :spell, :artifact
end 

class Enchanter < Student
    include IllusionSpells
     attr_reader :name
    def initialize
        @name = 'enchanter'
        @energy = calc_magic_energy(@name)
        @robe = assign_robe(@name)
        @spell = assign_spell
        @artifact = assign_artifact(@name)
    end
    
    private
    
    attr_reader :energy, :robe, :spell, :artifact
end 

class Illusionist < Student
    attr_reader :name
    include IllusionSpells
    def initialize
        @name = 'illusionist'
        @energy = calc_magic_energy(@name)
        @robe = assign_robe(@name)
        @spell = assign_spell
        @artifact = assign_artifact(@name)
    end
    
    private
    
    attr_reader :energy, :robe, :spell, :artifact
end 

class Necromancer < Student
    attr_reader :name
    include Necromancy
    include TimeMagic
    def initialize
        @name = 'necromancer'
        @energy = calc_magic_energy(@name)
        @robe = assign_robe(@name)
        @spell = assign_spell
        @artifact = assign_artifact(@name)
    end
    
    private
    
    attr_reader :energy, :robe, :spell, :artifact
end

john = Illusionist.new
harrrry = Enchanter.new
ron = Necromancer.new
hermi = Conjurer.new
useless = Illusionist.new


puts john
puts harrrry
puts ron 
puts hermi
puts useless

p Student.ancestors