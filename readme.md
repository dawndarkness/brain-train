# Brain-Train

Train your brain with simple mental maths.
This game is still under development, and was developed during my time as a student at Code Chrysalis. It was made in one week with Ruby, a language I had never studied/used before.

## About Brain-Train

Brain-Train aims to help young and old alike build their mental arithmetic skills. On game launch the player can select whether they want to practice addition, subtraction, multiplication or division by clicking the appropriate icon. The game then randomly generates different numbers/ equations for the player to solve. 

It is important to note that whatever the player types will count as input into the game. After completing their answer, they can press submit and then next question to generate another question. Once they have finished with their training, they can select the quit button on the top right of the game screen.

## Prerequisites

- Ruby
- Ruby2d

## Setup

1. Install ruby.

    Please see [ruby documentation](https://www.ruby-lang.org/en/documentation/installation/) for details on how to do this. 

1. Install Ruby2D

    ```
    gem install ruby2d
    ```
    <details><summary><b>Possible Apple M1 chip error</b></summary>
        If you have an error like this;

            ```
            You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory.
            ```

        Then run the following command before you run the `gem install ruby2d` command;

            ```
            export GEM_HOME="$HOME/.gem"
            ```
        Please note that you may have to do this every time you open the file.
    </details>

1. To run the game, execute this line of code in the command line;

    ```
    ruby game.rb
    ```

## Contributors

- **Dino artwork/Sprite**
    credit to: [Scissor Marks](https://twitter.com/ScissorMarks)

## Feedback

If you have feedback or questions, please find me on twitter [codingdawn](https://twitter.com/codingdawn)