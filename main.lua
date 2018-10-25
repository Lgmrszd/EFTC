scm = require("scenes_manager")
menu = require("scenes/main_menu")
assets = require("assets")

function love.load()
  assets.load_assets()
  scm.activate_scene(menu)
end

function love.keypressed(key, scancode, isrepeat)
  if key == "rctrl" then debug.debug() end
end

function love.update(dt)
  scm.update(dt)
end

function love.draw()
  scm.draw()
end
