class Hangman
    # attr_reader :lives
    attr_reader :board 
    def initialize
        @lives = 5
        @secret_word = word_list.sample
        @board = setup_board
    end
    
    def setup_board
         ["_"] * secret_word.size
    end

    def word_list
     [
         'Animals',
         'Fruits',
         'tiger',
         'cat',
         'dog',
         'apple'
      ]
    end

    def secret_word
        @secret_word
    end
    # secret_word = words.sample

    def start
        puts "Welcome to Hangman"
        while @lives > 0 && !won?
            puts "\n\nYou have #{@lives} lives left "

            puts board_state

            guess = make_guess

            update_board(guess)
        end

        if won?
            puts "You won!"
        else
            puts "You lost!"
        end
    
    end
    
    def won?
        board.join("") == secret_word
    end

    def make_guess
        puts "Please guess a letter: "
        gets.chomp
        # puts "your word was: #{secret_word}"
        
    end


    def board_state
        board.join(" ")
    end

    def update_board(guess)
        if secret_word.include?(guess)
            i = 0
            while i <secret_word.size
                if guess.downcase == secret_word[i].downcase
                 board[i] = secret_word[i]
                end
                i +=1
            end
        else
            @lives -= 1
        end
    end
end

game = Hangman.new
game.start
