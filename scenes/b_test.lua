local scm = require("scenes_manager")

local test = scm.Scene.new("b_test")

function test:update(dt)
end

function test:draw()
  love.graphics.print("Hello World!", 400, 300)
end

return test
