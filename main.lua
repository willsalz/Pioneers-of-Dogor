-- [[ Requires ]]

-- Library Requires

class = require("middleclass.middleclass")
_ = require("Moses.moses")

-- Local Requries

Die = require("die")

-- [[ Implementation ]]

-- LÖVE Callbacks

function love.load()
  loadText()
  loadMap()
  loadFPS()
  die = Die:new()
end

function love.update(dt)
  updateFPS()
  roll = die:roll()
end

function love.draw()
  drawMap()
  drawFPS()
  love.graphics.print("Roll: " .. roll, 10, 10)
end

-- Text

function loadText()
  love.graphics.setNewFont(45)
end

-- Map

function loadMap()
end

function drawMap()
end

-- FPS

function loadFPS()
  fps_history = {60,60,60,60,60,60,60,60,60,60}
  fps = 60
end

function updateFPS()
  _.pop(fps_history)
  _.push(fps_history, love.timer.getFPS())
  fps = math.floor( _.reduce(fps_history, function (acc,x) return (acc+x) end) / #(fps_history) )
end

function drawFPS()
  love.graphics.print("FPS: " .. fps, love.graphics.getWidth() - 200, 10)
end
