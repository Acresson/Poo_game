require 'pry'

class Player
attr_accessor :name
attr_accessor :life_points

  def initialize (name_to_save)
    @name = name_to_save
    @life_points=10
  end

  def show_state
    puts "#{@name} à #{@life_points} points de vie"
    if self.life_points<=0 
      puts "RIP in Peace"
    end
  end

  def gets_damage(damage_recieved)
    self.life_points = self.life_points-damage_recieved
    puts "#{name} a subi #{damage_recieved} dommages"
    if self.life_points>0
      puts "Son niveau de vie est maintenant de #{life_points}pv"
    elsif self.life_points<=0
      puts "#{name} meurt dans d'affreuses souffrances. Sa famille est couverte de honte."
    end
  end 

  def attacks(target)
    hit = compute_damage
    puts "#{self.name} attaque #{target.name}"
    target.gets_damage(hit)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize (name_to_save)
    @name = name_to_save
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} à #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    if self.life_points<=0 
      puts "RIP in Peace"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end
  
  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}!"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Cette arme est bien meilleure que celle que tu avais ! Tu vas faire un carnage avec ! "
    else 
      puts "Dommage, cette nouvelle arme est moins bien que celle que tu possèdes."
    end
  end

  def search_health_pack
    new_health_pack = rand(1..6)
    if new_health_pack == 1 
      puts "Tu perds ton temps à chercher. Tu ne trouveras rien ici. "
    elsif new_health_pack >1 && new_health_pack <=5
      @life_points += 50
        if @life_points > 100
           @life_points = 100
        end
      puts " Bravo, tu as trouvé un pack de +50 points de vie !"
      puts "Ton niveau de vie est maintenant de #{life_points}PV."
    elsif new_health_pack == 6
      @life_points += 80
        if @life_points >100
           @life_points = 100
        end
      puts "Waow ! Tu as trouvé un pack de +80 points de vie ! Quelle chance! "
      puts "Ton niveau de vie est maintenant de #{life_points}PV."
    end
  end
    


end
