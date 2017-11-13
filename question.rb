class Question
  attr_accessor :num1, :num2, :answer, :question, :player
  def initialize(player)
    @num1 = rand(20)
    @num2 = rand(20)
    @answer = num1 + num2
    @question = "#{player}: What does #{num1} plus #{num2} equal?"
    @player = player
  end
  def pose
    puts "#{self.question}"
    gets.chomp
  end
  def correct_answer?(value)

    if self.answer.to_i == value.to_i
      puts "Correct #{self.player}!"
      return true
    else
      puts "Inorrect #{self.player}! You lose a life!"
      return false
    end
  end

end