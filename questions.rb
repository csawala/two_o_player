module MathGame
  class Questions
    attr_reader :num1, :num2, :q_answer

    def initialize
      @num1 = rand(0...20)
      @num2 = rand(0...20)
      @q_answer = @num1 + @num2
    end

    def new_question(turn, player)
      puts ''
      puts "----- Question #{turn} -----"
      puts "#{player}'s turn."
      print "#{@num1} plus #{@num2} = "
    end

    def evaluate(p_answer)
      @q_answer == p_answer.to_i
    end
  end
end