require 'ruby2d'

set width: 800, height: 600
set background: '#A9D7C6'
set title: 'Brain-Train'

class Play

    attr_accessor :clear
    attr_accessor :submit
    attr_accessor :end

    def initialize(operator)
        @operator = operator
        @counter = 0
        @tally = 0
        @score = ""
        @end = Square.new(
            color: 'olive',
            x: 700, y: 0,
            size: 100,
            opacity: 0.5
            )
        @end_text = Text.new(
            "Quit",
            x: 730,
            y: 30,
            size: 25,
            z: 10,
        )
        @clear = nil
        @clear_text = nil
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
        number2 = nil
    

        if @operator == '+'
            number2 = rand(20)
            @answer = number1 + number2
        elsif @operator == '-'
            number2 = rand(20)
            @answer = number1 - number2
        elsif @operator == '/'
            number1 = rand(1...20)
            number2 = rand(1...5)
            @answer = number1 / number2
        else
            number2 = rand(10)
            @answer = number1 * number2
        end 

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
            "#{@operator}",
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
    end 

    def CheckAnswer
        if @player_answer.to_i == @answer
            @counter += 1
            @tally += 1
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

    def Quit
        @clear.remove
        @clear_text.remove
        @submit.remove
        @submit_text.remove
        @end.remove
        @end_text.remove
        @game_over_screen = Text.new(
            "Final Score: #{@tally} out of #{@counter}",
            x: 170,
            y: 400,
            size: 50,
            z: 10,
        )
        zombie = Sprite.new(
            'DinoSprites - vita.png',
            width: 300,
            height: 300,
            clip_width: 24,
            x: 220,
            y: 110,
            loop: true,
        )
        zombie.play
    end
end

#This is the start screen

welcome_message = Text.new(
    "Let's Brain Train!",
    x: 220,
    y: 30,
    size: 50
)
select_operator = Text.new(
    "Choose your poison!",
    x: 180,
    y: 80,
    size: 50
)
operator_plus = Text.new(
    "+",
    x: 150,
    y: 230,
    size: 100,
    z: 10,
)
operator_minus = Text.new(
    "-",
    x: 310,
    y: 220,
    size: 100,
    z: 10,
)
operator_multiply = Text.new(
    "X",
    x: 440,
    y: 230,
    size: 100,
    z: 10,
)
operator_divide = Text.new(
    "%",
    x: 580,
    y: 230,
    size: 100,
    z: 10,
)
operator_plus_box = Square.new(
    color: 'blue',
    x: 130, y: 250,
    size: 100,
    opacity: 0.5
)
operator_minus_box = Square.new(
    color: 'blue',
    x: 280, y: 250,
    size: 100,
    opacity: 0.5
)
operator_multiply_box = Square.new(
    color: 'blue',
    x: 430, y: 250,
    size: 100,
    opacity: 0.5
)
operator_divide_box = Square.new(
    color: 'blue',
    x: 580, y: 250,
    size: 100,
    opacity: 0.5
)

play = nil

#These are the event handlers

#On the start screen the player can select which maths operator they want to use
start_game = on :mouse_down do |event|
    if operator_plus_box.contains?(event.x, event.y)
        play = Play.new '+'
        play.Stage
        welcome_message.remove
        select_operator.remove
        operator_plus.remove
        operator_minus.remove
        operator_multiply.remove
        operator_divide.remove
        operator_minus_box.remove
        operator_plus_box.remove
        operator_multiply_box.remove
        operator_divide_box.remove
    elsif operator_minus_box.contains?(event.x, event.y)
        play = Play.new '-'
        play.Stage
        welcome_message.remove
        select_operator.remove
        operator_plus.remove
        operator_minus.remove
        operator_multiply.remove
        operator_divide.remove
        operator_minus_box.remove
        operator_plus_box.remove
        operator_multiply_box.remove
        operator_divide_box.remove
    elsif operator_multiply_box.contains?(event.x, event.y)
        play = Play.new '*'
        play.Stage
        welcome_message.remove
        select_operator.remove
        operator_plus.remove
        operator_minus.remove
        operator_multiply.remove
        operator_divide.remove
        operator_minus_box.remove
        operator_plus_box.remove
        operator_multiply_box.remove
        operator_divide_box.remove
    elsif operator_divide_box.contains?(event.x, event.y)
        play = Play.new '/'
        play.Stage
        welcome_message.remove
        select_operator.remove
        operator_plus.remove
        operator_minus.remove
        operator_multiply.remove
        operator_divide.remove
        operator_minus_box.remove
        operator_plus_box.remove
        operator_multiply_box.remove
        operator_divide_box.remove
    end
end

#This clears the last question and stages the next question
next_question = on :mouse_down do |event|
    if play.clear.contains?(event.x, event.y)
        play.Clear
        play.Stage
    end
end

#Player answer is stored with this event
enter_answer = on :key_down do |event|
    play.PlayerInput(event.key)
end

#Player submits answer and the answer is checked
submit_answer = on :mouse_down do |event|
    if play.submit.contains?(event.x, event.y)
        play.CheckAnswer
    end
end

#Player can quit the game
quit_game = on :mouse_down do |event|
    if play.end.contains?(event.x, event.y)
        play.Clear
        play.Quit
    end
end

show