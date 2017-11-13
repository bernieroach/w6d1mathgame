class Player
  attr_accessor :name, :lives
  def initialize(name)
    self.name = name
    self.lives = 3
    puts "#{self.name} player created with #{self.lives} lives"
  end
  def lose_life
    if self.lives > 0
      self.lives -= 1
    else
      self.lives = 0
    end
  end
end



class Game
  attr_accessor :player1, :player2, :turn
  def initialize
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @turn = 1
    puts "Start the math game"
  end

  def ask_question
    numbers_to_add = self.pick_numbers
    correct_answer = numbers_to_add.inject(0) { | sum , num | sum + num }
    player_answer = self.pose_question(numbers_to_add[0], numbers_to_add[1])
    puts player_answer
    puts correct_answer
    if player_answer.to_i == correct_answer.to_i
      puts "Correct!"
    else
      puts "Incorrect! You lose a life"
      if turn == 1
        self.player1.lose_life
      else
        self.player2.lose_life
      end
    end
  end
  def play_game
    self.ask_question
    self.game_status
    if self.game_over?
      self.declare_winner
    else
      self.change_turns
      self.play_game
    end
  end

  def game_status
    puts "P1: #{self.player1.lives}/3 P2: #{self.player2.lives}/3"
  end
  def change_turns
    puts "----- CHANGE TURNS -----"
    if self.turn == 1
      self.turn = 2
    else
      self.turn = 1
    end
  end
  def pick_numbers
    [rand(20), rand(20)]
  end

  def pose_question(num1, num2)
    if self.turn == 1
    p self.player1.name
    else
    p self.player2.name
    end
    p " What does #{num1} plus #{num2} equal?"
    gets.chomp
  end

  def game_over?
    if self.player1.lives == 0 || self.player2.lives == 0
      puts "----- GAME OVER -----"
      true
    else
      false
    end
  end

  def declare_winner
    if self.player1.lives == 0
      puts "Player 2 wins!"
    elsif
       self.player2.lives == 0
      puts "Player 1 wins!"
    end
  end

end

game = Game.new
game.play_game
