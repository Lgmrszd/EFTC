scm = require("scenes_manager")
menu = require("scenes/main_menu")

scm.activate_scene(menu)

function love.keypressed(key, scancode, isrepeat)
  if key == "rctrl" then debug.debug() end
end

function love.update(dt)
  scm.update(dt)
end

function love.draw()
  scm.draw()
end
