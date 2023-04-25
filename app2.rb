require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "_____________________________________________"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO'  |"
puts "| Le but du jeu est d'être le dernier en vie |"
puts "|               Bon chance                   |"
puts " ____________________________________________"
puts ""
puts ""
puts "Quel est ton nom, guerrier? "
print ">"
player = HumanPlayer.new(gets.chomp.to_s)
ennemis = []
ennemis << ia1 = Player.new('Josianne')
ennemis << ia2 = Player.new('José')
puts ""
puts "C'est l'heure du Du-du-du-du-du DUEL ! "
puts ""
while player.life_points > 0 && ia1.life_points > 0 ||  ia2.life_points > 0
  break if player.life_points <= 0 
 
  puts player.show_state
  puts ""
  puts "Quelle action souhaite tu faire ? "
  puts ""
  puts "Pour cherche une nouvelle arme écrit 'a'"
  puts "Pour chercher un kit de soin écrit 's'"
  puts "Pour attaquer Josianne écrit '0'"
  puts "Pour attaquer José écrit'1'"
  print ">"
  choice = gets.chomp
  puts""
  if choice == "a"
    player.search_weapon
  elsif choice == "s"
    player.search_health_pack
  elsif choice == "0"
    player.attacks(ia1)
  elsif choice == "1"
    player.attacks(ia2)
  end
  puts""
  if ia1.life_points > 0 || ia2.life_points > 0
    puts"C'est maintenant aux ennemis de riposter"
  end




  ennemis.each do |i|
    if i.life_points > 0 
      i.attacks(player)
    break if player.life_points <= 0
    end
  end

  if player.life_points > 0 && ia1.life_points <= 0 && ia2.life_points <= 0
    puts "______________________________________"
    puts "|C'est le sol jonché des cadavres de |"
    puts "|tes ennemis que tu fêtes ta victoire|"
    puts "|  avec une grande coupe de vin de   |"
    puts "|             pissenlits             |"
    puts "|           Bravo Champion           |"
    puts "|____________________________________|"
  elsif player.life_points <= 0 && (ia1.life_points > 0 || ia2.life_points > 0)
    puts" ______________________________________"
    puts"|             Quelle honte             |"
    puts"| Se faire tuer par les clodos du coin |"
    puts"| T'aurais dû continuer les études ... |"
    puts"|______________________________________|"
  end
end









  
