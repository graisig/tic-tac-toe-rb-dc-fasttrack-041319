# Define display_board that accepts a board and prints
# out the current state.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  return board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  return index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Define your play method below
def play(board)
  
  turn_num = 1
  while turn_num <= 9
    turn(board)
      turn_num += 1
  end
  
end

def turn_count(board)

  count = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
      count += 1
    end
  end
  
  return count
end

def current_player(board)
  
  num_turns = turn_count(board)
  
  if num_turns % 2 == 0
    return "X"
  else
    return "O"
  end
  
#  turn = num_turns % 2 == 0 ? "X" : "O"
 # return turn
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

    # check each win combination for win
    win_X = win_combination.all? {|cell| board[cell] == "X"}
    win_O = win_combination.all? {|cell| board[cell] == "O"}

    if win_X or win_O
      return win_combination
    else
      false
    end
  end
end

board = ["O","O","O"," "," "," "," "," "," "]
def full?(board)

  full_board = [0,1,2,3,4,5,6,7,8].all? {|index| position_taken?(board, index)}
  return full_board

end

def draw?(board)
  return full?(board) && !won?(board)
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  
  win_combination = won?(board)
  if win_combination.is_a? Array
    return board[win_combination[0]]
  else
    return nil
  end
  
end
puts winner(board)