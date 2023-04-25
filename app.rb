require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

Player1 = Player.new('Josianne')
Player2 = Player.new('José')

#Présentation des combattants
puts "Dans le coin gauche #{Player1.name}, 103kg, #{Player1.life_points} points de vie, et 67dents tranchantes comme des rasoirs."
puts "En face: #{Player2.name}, 98kg de muscles, #{Player2.life_points} points de vie également, et des bras qui font la taille de mes cuisses."
puts ""
puts ""
puts "Qui prendra le dessus dans cette lutte acharnée?! C'est ce que l'on va découvrir tout de suite ! Place au combat !"
puts ""
puts ""


  while Player1.life_points>0 && Player2.life_points>0
    Player1.attacks(Player2)
    puts ""
    puts ""
  if Player2.life_points>0
    Player2.attacks(Player1)
    puts ""
    puts ""
  end
end
binding.pry