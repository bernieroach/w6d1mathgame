require './player'
require './question'

class Game
  attr_accessor :player1, :player2, :turn
  def initialize
    @player1 = Player.new("player1")
    @player2 = Player.new("player2")
    @turn = 1
    puts "Start the math game"
  end

  def ask_question
    if turn == 1
      question = Question.new(self.player1.name)
    else
      question = Question.new(self.player2.name)
    end
    player_answer = question.pose
    if !question.correct_answer?(player_answer)
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