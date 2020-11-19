class TicTacToe
    attr_reader :board
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
                        [0,4,8], [2,4,6]]
    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end


    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
      end
    
      def input_to_index(input)
        input.to_i - 1
      end
    
      def move(index, token ="X")
        
        board[index] = token
      end
    
      def position_taken?(index)
        board[index] == "X" || board[index] == "O"
      end
    
      def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
      end
    
      def turn_count
        (board - [" "]).length
      end
    
      def current_player
        turn_count.odd? ? "O" : "X"
      end
    
      def turn
        user_input = gets.strip
        user_index = input_to_index(user_input)
        valid_move?(user_index) ? move(user_index, current_player) : turn
        display_board
      end
    
      def won?
        WIN_COMBINATIONS.detect do |win_combos|
            if board[win_combos[0]] == board[win_combos[1]] && board[win_combos[1]] == board[win_combos[2]] && position_taken?(win_combos[0])
              return win_combos
            end
          end
          false
      end
    
      def full?
        turn_count == 9
      end
    
      def draw?
        !won? && full?
      end
    
      def over?
        draw? || won?
      end
    
      def winner
          if winning_combo = won?
            board[winning_combo[0]] 
          end
      end

      def play
        until over?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
      end
end
