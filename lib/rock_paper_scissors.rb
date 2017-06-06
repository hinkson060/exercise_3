class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    unless legal?(player1[1]) && legal?(player2[1])
      raise RockPaperScissors::NoSuchStrategyError.new("Strategy must be one of R,P,S")
    end
    result = outcome(player1[1], player2[1])
    if result == 1
      return player1
    elsif result == 2
      return player2
    end
  end

  def self.tournament_winner(tournament)
    if ( tournament[0][1].is_a? String ) && ( tournament[1][1].is_a? String )
      winner(tournament[0], tournament[1])
    else
      winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
    end
  end
  
  def self.legal?(choice)
    a = ['R', 'P', 'S']
    a.include?(choice)
  end
  
  def self.outcome(choice1, choice2)
    if choice1 == choice2
      return 1
    elsif choice1 == 'R' && choice2 == 'S'
     return 1
    elsif choice1 == 'R' && choice2 == 'P'
     return 2
    elsif choice1 == 'P' && choice2 == 'R'
     return 1
    elsif choice1 == 'P' && choice2 == 'S'
     return 2
    elsif choice1 == 'S' && choice2 == 'P'
     return 1
    elsif choice1 == 'S' && choice2 == 'R'
     return 2
    end
  end
end
