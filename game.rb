module MathGame
  class Game
    attr_accessor :turn

    def initialize
      @turn = 1
    end

    def next_turn
      @turn += 1
    end

    def welcome(p1, p2)
      puts "Welcome #{p1} and #{p2}."
      puts "You each have three lives, and your survival is based on your math skills."
      puts "   Answer wisely and you may see the light of day again."
      puts "      Let's begin..."
    end

    def game_status(p1, p2)
      puts "#{p1.name}: #{p1.lives}/3      #{p2.name}: #{p2.lives}/3"
    end

    def winner(p1, p2)
      winner = p1.lives > p2.lives ? p1 : p2
      puts ''
      puts "Congratulations #{winner.name}, you are free once again, and with #{winner.lives} lives remaining."
    end
  end
end