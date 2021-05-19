require 'ruby2d'

set width: 800, height: 600
set background: '#A9D7C6'
set title: 'Brain-Train'

#create a class that uses the start screen and selects the parameters for the game
#create a game class that uses the info to actually play the game
#create a trigger event for input

operator = '+'
# counter = 0
# answer = nil

class Play

    attr_accessor :clear
    attr_accessor :submit

    def initialize
        @counter = 0
        @tally = 0
        @score = 0
        @clear = Square.new(
            color: 'maroon',
            x: 600, y: 500,
            size: 125,
            opacity: 0.5
            )
        @clear_text = Text.new(
            "Next",
            x: 640,
            y: 535,
            size: 25,
            z: 10,
        )
        @submit = Square.new(
            color: 'fuchsia',
            x: 490, y: 500,
            size: 125,
            opacity: 0.5
            )
        @submit_text = Text.new(
            "Submit",
            x: 510,
            y: 535,
            size: 25,
        )
            
        @equation_box1 = nil
        @equation_box2 = nil
        @operator_text = nil
        @equals_text = nil
        @answer_text = nil
        @box_a = nil
        @box_b = nil
        @answer_box = nil
        @answer = nil
        @player_answer = String.new
        @player_ans_text = Text.new(
            "#{@player_answer}",
            x: 262,
            y: 270,
            size: 100,
            z: 10,
        )
        @player_answer_box = nil
        @running_total = Text.new(
            "",
            x: 50,
            y: 270,
            size: 100,
            z: 10,
        )
        end
        
    def Stage 
        number1 = rand(20)
        number2 = rand(20)
        @answer = number1 + number2
        operator = '+'
        @clear = Square.new(
            color: 'maroon',
            x: 600, y: 500,
            size: 125,
            opacity: 0.5
            )
        @clear_text = Text.new(
            "Next",
            x: 640,
            y: 535,
            size: 25,
            z: 10,
        )
        @equation_box1 = Text.new(
            "#{number1}",
            x: 20,
            y: 90,
            size: 100,
            z: 10,
        )       
        @equation_box2 = Text.new(
            "#{number2}",
            x: 262,
            y: 90,
            size: 100,
            z: 10,
        ) 
        @operator_text = Text.new(
            "#{operator}",
            x: 165,
            y: 90,
            size: 100,
            z: 10,
        ) 
        @equals_text = Text.new(
            "=",
            x: 410,
            y: 90,
            size: 100,
            z: 10,
        )
        @answer_text = Text.new(
            "?",
            x: 535,
            y: 90,
            size: 100,
            z: 10,
        )
        @box_a = Square.new(
            color: 'blue',
            x: 10, y: 100,
            size: 125,
            z: 0,
            opacity: 0.5
        )
        @box_b = Square.new(
            color: 'green',
            x: 255, y: 100,
            size: 125,
            opacity: 0.5
        )
        @answer_box = Square.new(
            color: 'orange',
            x: 500, y: 100,
            size: 125,
            opacity: 0.5
        )
        @player_answer_box = Rectangle.new(
        color: 'red',
        x: 255, y: 300,
        size: 150,
        opacity: 0.5
        )
    end
        
    def Clear
        @equation_box1.remove
        @equation_box2.remove
        @operator_text.remove
        @equals_text.remove
        @answer_text.remove
        @box_a.remove
        @box_b.remove
        @answer_box.remove
        @player_answer = String.new
        @player_ans_text.remove
        @player_answer_box.remove
        @clear.remove
        @clear_text.remove
        @running_total.remove
    end
        
    def ShowPlayerAnswer(player_answer)
        @player_ans_text.remove
        @player_ans_text = Text.new(
            "#{@player_answer}",
            x: 262,
            y: 270,
            size: 100,
            z: 10,
        )
    end

    def PlayerInput(arg)
        @player_answer += arg
        ShowPlayerAnswer(@player_answer)
        # puts @player_answer
    end 

    def CheckAnswer
        # puts @answer
        if @player_answer.to_i == @answer
            @counter += 1
            @tally += 1
            # puts "correct"
            @running_total = Text.new(
                "Correct! #{@tally} out of #{@counter}",
                x: 0,
                y: 0,
                size: 50,
                z: 10,
            )
        else
            @counter += 1
            @running_total = Text.new(
                "Incorrect! #{@tally} out of #{@counter}",
                x: 0,
                y: 0,
                size: 50,
                z: 10,
            )
        end
    end
end

play = Play.new

play.Stage

start_game = on :mouse_down do |event|
    if play.clear.contains?(event.x, event.y)
        play.Clear
        play.Stage
    end
end

enter_answer = on :key_down do |event|
    play.PlayerInput(event.key)
end

submit_answer = on :mouse_down do |event|
    if play.submit.contains?(event.x, event.y)
        play.CheckAnswer
    end
end

# next_stage = on :mouse_down do |event|
# end

show