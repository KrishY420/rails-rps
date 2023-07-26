class GameController < ApplicationController
  
  def index
    render "game_templates/index"
  end

  def rock
    play_game('rock')
    render "game_templates/game_results"
  end

  def paper
    play_game('paper')
    render "game_templates/game_results"
  end

  def scissors
    play_game('scissors')
    render "game_templates/game_results"
  end

  private

  def play_game(my_choice)
    computer_choices = ["rock", "paper", "scissors"]
    computer_choice = computer_choices.sample

    @played_move = "We played #{my_choice.capitalize}!"

    if my_choice == computer_choice
      @result = "We tied!"
    elsif (my_choice == "rock" && computer_choice == "scissors") ||
          (my_choice == "scissors" && computer_choice == "paper") ||
          (my_choice == "paper" && computer_choice == "rock")
      @result = "We won!"
    else
      @result = "We lost!"
    end

    @computer_move = "They played #{computer_choice.capitalize}!"
  end
end
