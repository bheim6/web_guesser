require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = background_check(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
end

  def check_guess(guess)
    if guess.to_i == SECRET_NUMBER
      "You got it right!\nTHE SECRET NUMBER is #{SECRET_NUMBER}"
    elsif guess.to_i > (SECRET_NUMBER + 5)
      "Way too high!"
    elsif guess.to_i < (SECRET_NUMBER - 5)
      "Way too low!"
    elsif guess.to_i > SECRET_NUMBER
      "Too high!"
    elsif guess.to_i < SECRET_NUMBER
      "Too low!"
    end
  end

  def background_check(result)
    if result == "You got it right!\nTHE SECRET NUMBER is #{SECRET_NUMBER}"
      "#00FF00"
    elsif result == "Way too high!" || result == "Way too low!"
      "#FF0000"
    elsif result == "Too high!" || result == "Too low!"
      "#FFC0CB"
    end
  end
