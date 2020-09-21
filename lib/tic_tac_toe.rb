class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS =
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8],]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(choice)
    @choice = choice.to_i-1
  end
  
  def move(index, player= "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between 
  end
  
  def turn_count
    count = 0  
    @board.each do |i|
      count += 1 if i == "X"|| i== "O"
    end
    count 
  end
  
  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    choice = gets.strip
    position = input_to_index(choice)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else 
      turn 
    end
    
  end
  
  #def won?
    #WIN_COMBINATIONS.detect do |combo|
      #@board[combo[0]] ==
      #@board[combo[1]] &&
      #@board[combo[1]] ==
      #@board[combo[2]] &&
      
  
  def over?
    won? || draw?
  end
  
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
    end
  end
      
end

