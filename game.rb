require 'ruby2d'

set width: 800, height: 600
set background: '#A9D7C6'
set title: 'Brain-Train'

#create a class that uses the start screen and selects the parameters for the game
#create a game class that uses the info to actually play the game
#create a trigger event for input

operator = '+'
counter = 0

class Play

    attr_accessor :clear

    def initialize
        @clear = Square.new(
            color: 'maroon',
            x: 600, y: 500,
            size: 125,
            opacity: 0.5
            )
        @equation_box1 = nil
        @equation_box2 = nil
        @operator_text = nil
        @equals_text = nil
        @answer_text = nil
        @box_a = nil
        @box_b = nil
        @answer_box = nil
        @player_answer = ""
        @player_ans_text = nil
        @player_answer_box = nil
        end
        
    def Stage 
        number1 = rand(20)
        number2 = rand(20)
        answer = number1 + number2
        operator = '+'
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
        @player_answer = ""
        @player_ans_text.remove
        @player_answer_box.remove
    end
        
    def ShowPlayerAnswer(player_answer)
        @player_ans_text = Text.new(
            "#{@player_answer}",
            x: 262,
            y: 270,
            size: 100,
            z: 10,
        )
    end

    def Test1(arg)
        @player_answer += arg
        ShowPlayerAnswer(@player_answer)
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
    play.Test1(event.key)
end

# next_stage = on :mouse_down do |event|
# end

show