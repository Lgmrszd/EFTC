local scm = require("scenes_manager")

local color = {
  128/255,
  46/255,
  222/255
}
local min_radius = 20
local max_radius = 200
local dr = max_radius - min_radius
local change_time = 1
local growing = true
local time = 0
local radius = 0

local test = scm.Scene.new("test")

function test:update(dt)
  time = time + dt
  if time > change_time then
    growing = not growing
    time = time - change_time
  end
  if growing then
    radius = min_radius + dr*(time/change_time)
  else
    radius = max_radius - dr*(time/change_time)
  end

end


function test:draw()
  love.graphics.setColor(color)
  love.graphics.circle('fill', 400, 300, radius, 100)
  love.graphics.print("Hello World!", 400, 300)
end

return test
