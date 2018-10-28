local assets = require("assets")
local scm = require("scenes_manager")

function love.load()
  assets.load_assets()
  local menu = require("scenes/main_menu")
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
