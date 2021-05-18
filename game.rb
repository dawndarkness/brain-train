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

    def initialize
        @number1 = rand(20)
        @number2 = rand(20)
        @answer = @number1 + @number2
        @operator = '+'
        @ans1
        @ans2
        @ans3
    end
    
    def question

        double_digs_text1 = Text.new(
            "#{@number1}",
            x: 20,
            y: 90,
            size: 100,
            z: 10,
        )
        
        double_digs_text2 = Text.new(
            "#{@number2}",
            x: 262,
            y: 90,
            size: 100,
            z: 10,
        )
        
        operator_text = Text.new(
            "#{@operator}",
            x: 165,
            y: 90,
            size: 100,
            z: 10,
        )
        
        equals_text = Text.new(
            "=",
            x: 410,
            y: 90,
            size: 100,
            z: 10,
        )
        
        answer_text = Text.new(
            "?",
            x: 535,
            y: 90,
            size: 100,
            z: 10,
        )
        
        box_a = Square.new(
            color: 'blue',
            x: 10, y: 100,
            size: 125,
            z: 0,
            opacity: 0.5
        )
        
        box_b = Square.new(
            color: 'green',
            x: 255, y: 100,
            size: 125,
            opacity: 0.5
        )
        
        answer_box = Square.new(
            color: 'orange',
            x: 500, y: 100,
            size: 125,
            opacity: 0.5
        )

        a1 = Square.new(
        color: 'red',
        x: 10, y: 300,
        size: 125,
        z: 0,
        opacity: 0.5
        )

        a2 = Square.new(
        color: 'red',
        x: 255, y: 300,
        size: 125,
        opacity: 0.5
        )

        a3 = Square.new(
        color: 'red',
        x: 500, y: 300,
        size: 125,
        opacity: 0.5
        )

        ans1_text = Text.new(
            "#{@ans1}",
            x: 20,
            y: 90,
            size: 100,
            z: 10,
        )
        
        ans2_text = Text.new(
            "#{@ans2}",
            x: 262,
            y: 90,
            size: 100,
            z: 10,
        )
        
        ans3_text = Text.new(
            "#{@ans3}",
            x: 165,
            y: 90,
            size: 100,
            z: 10,
        )
    end

end

play = Play.new

start_message = Text.new(
    "Let's train our brains! Please select an operator.",
    x: 200,
y: 20,
size: 20,
color: '#451146' 
)

operator_text = Text.new(
"+",
x: 130,
y: 90,
size: 100,
z: 10,
)

box_a = Square.new(
color: 'blue',
x: 100, y: 100,
size: 125,
opacity: 0.5
)

start_game = on :mouse_down do |event|
    if box_a.contains?(event.x, event.y)
        operator = '+'
        start_message.remove
        operator_text.remove
        box_a.remove
        play.question
    end
end

#not sure how to get at the variables. This is probably a logic issue.
#need to allow player to click on the box to select the answer that they want

answer_select = on :mouse_down do |event|
    if Play::a1.contains?(event.x, event.y)
        if Play::answer == Play::ans1
            counter += 1
            puts counter
        end
    end
end

# end

show