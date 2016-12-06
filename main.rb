require './players'
require './questions'
require './game'


def new_players
  print "Player 1, enter your name: "
  p1 = MathGame::Player.new(gets.chomp)
  print "Player 2, enter your name: "
  p2 = MathGame::Player.new(gets.chomp)

  return p1, p2
end


puts "I want to play a game..."
player1, player2 = new_players

game = MathGame::Game.new
game.welcome(player1.name, player2.name)


until (player1.lives == 0 || player2.lives == 0) do
  curr_player = (game.turn % 2 == 1) ? player1 : player2

  question = MathGame::Questions.new
  question.new_question(game.turn, curr_player.name)
  answer = gets.chomp

  if question.evaluate(answer)
    puts "Correct. #{curr_player.lives} lives remain."
  else
    curr_player.lose_life

    if curr_player.lives > 0
      puts "Incorrect. One life down, you now have #{curr_player.lives} remaining."
    else
      puts "It seems math is not your strength, and living is not in your future."
    end
  end


  if curr_player.lives > 0
    game.game_status(player1, player2)
  end
  game.next_turn
end

game.winner(player1, player2)
