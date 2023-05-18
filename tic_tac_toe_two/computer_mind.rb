# This program adds intelligence to the computer's behavior by 
# assessing threat levels for each square on the board


# ALGORITHM
  # program will take in the board at its current state
  # program will assess the positions occupied by an 'X'
  # program will then assess the threat level of unfilled boxes
  # if the threat of all the available squares is the same,
  # select a random square from the available squares
  # program will select and return the number of the box that has
    # the highest threat value
module ComputerMind
    def opening?(line, board)
        line.each do |pos|
          return false if board[pos - 1] == 'O'
        end
        true
    end
  
    def threat_assessor(board, available_spots)
        # the array is such that:
            # state[0] | state[1] | state[2]
            # state[3] | state[4] | state[5]
            # state[6] | state[7] | state[8]
        # so assessing threat will require going through winning lines
        # and finding how many of those winning lines has an X for two 
            # of the three positions
        # LINES: lines = [[1,2,3], [1,4,7],[1,5,9],[4,5,6],[2,5,8],[7,8,9],[7,5,3],[3,6,9]]
            # iterate through these winning lines
                # if state[ln_num - 1] == 'X'
                    # increment threat counter by 1
                # the moment threat counter == 2
                    # select and return the position whose state is ' '
                # that position is the computer's choice
                # if iteration completes and threat never hits 2, make a random
                # selection
            #
        #
        lines = [[1,2,3], [1,4,7],[1,5,9],[4,5,6],[2,5,8],[7,8,9],[7,5,3],[3,6,9]]
        
        lines.each do |line|
          threat_counter = 0
          danger_line = nil
          line.each do |position|
            if board[position - 1] == 'X'
              threat_counter += 1
            end
            if threat_counter >= 2 && opening?(line, board)
              danger_line = line
              break
            end
          end
            if threat_counter >= 2 && opening?(line, board)
              computer_choice = danger_line.select{|position| board[position-1] == ' '}[0]
              return computer_choice
            end 
        end
        return available_spots.sample
    end
end


# TESTS

p threat_assessor(['X','X','O', 'O', 'O', ' ', ' ', ' ', ' '], [5,6,7,8]) # => 2 PASS
p threat_assessor([' ','X','X', ' ', ' ', ' ', ' ', ' ', ' '], [0,3,4,5,6,7,8]) # => 0 PASS
p threat_assessor(['X',' ',' ', ' ', ' ', ' ', ' ', ' ', 'X'], [1,2,3,4,5,6,7]) # => 4 PASS
p threat_assessor(['X',' ',' ', 'X', ' ', ' ', ' ', ' ', ' '], [2,3,4,5,6,7,8]) # => 6 PASS
p threat_assessor(['X',' ','X', ' ', ' ', ' ', ' ', ' ', 'O'], [1,3,4,5,6,7]) # => 6 PASS
