local Die = class('Die') -- 'Die' is the class' name

function Die:initialize()
    love.math.setRandomSeed(os.time()) 
end

Die.static.roll_min = 1 -- class variable (also admits methods)
Die.static.roll_max = 6 -- class variable (also admits methods)

function Die:roll()
  local first_roll = love.math.random(Die.static.roll_min, Die.static.roll_max)
  local second_roll = love.math.random(Die.static.roll_min, Die.static.roll_max)
  return first_roll + second_roll
end

return Die
