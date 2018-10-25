scm = require("scenes_manager")
b_test = require("scenes/b_test")

scm.activate_scene(b_test)

function love.keypressed(key, scancode, isrepeat)
  if key == "rctrl" then debug.debug() end
end

function love.update(dt)
  scm.update(dt)
end

function love.draw()
  scm.draw()
end
