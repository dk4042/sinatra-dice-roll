require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"


get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	erb(:two_six, { :layout => :wrapper })
end

get("/dice/2/10") do 
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  erb(:one_t, { :layout => :wrapper })
end

get("/dice/1/20") do
  first_die = rand(1..20)
  outcome = "You rolled a #{first_die}."
  erb(:one_twenty,{ :layout => :wrapper })
end

get("/dice/5/4") do 
  first_die = rand(1..4)
  second_die = rand(1..4)
  th_die = rand(1..4)
  fo_die = rand(1..4)
  fi_die = rand(1..4)

  sum = first_die + second_die + th_die + fo_die + fi_die

  outcome = "You rolled a #{first_die}, a #{second_die}, a #{th_die}, a #{fo_die}, and a #{fi_die} for a total of #{sum}."
  erb(:five_four, { :layout => :wrapper })
end

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:elephant)
end
