local scm = require("scenes_manager")

local test = scm.Scene()
local angle = 0
local size = 64
local time_passed = 0
local frames = 0
local fps = 0
local updates =0
local ups = 0

function test:update(dt)
  updates = updates + 1
  time_passed = time_passed + dt
    if time_passed > 1 then
      time_passed = time_passed - 1
      fps = frames
      ups = updates
      frames = 0
      updates = 0
    end
  angle = angle + dt*(math.pi/2)
end

function test:draw()
  frames = frames + 1
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.print("FPS: "..fps, 150, 10)
  love.graphics.print("UPS: "..ups, 150, 25)
  -- love.graphics.translate(size, size)
  love.graphics.rotate(angle)
  love.graphics.translate(-size, -size)
  love.graphics.setColor(232/255, 239/255, 36/255, 1)
  love.graphics.rectangle("fill", size, size, size, size)
  love.graphics.rectangle("fill", 0, 0, size, size)
  love.graphics.setColor(244/255, 201/255, 26/255, 1)
  love.graphics.rectangle("fill", 0, size, size, size)
  love.graphics.rectangle("fill", size, 0, size, size)
end

return test
