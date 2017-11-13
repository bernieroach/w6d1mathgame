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