scm = require("scenes_manager")
menu = require("scenes/main_menu")
local assets = require("assets")
shader = require("shader_test")

function love.load()
  assets.load_assets()
  scm.activate_scene(menu)
  -- shader.load()
end

function love.keypressed(key, scancode, isrepeat)
  if key == "rctrl" then debug.debug() end
end

function love.update(dt)
  -- shader.update(dt)
  scm.update(dt)
end

function love.draw()
  -- shader.draw()
  scm.draw()
end
