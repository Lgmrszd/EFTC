local assets = require("assets")
local scm = require("scenes_manager")

function love.load()
  assets.load_assets()
  local menu = require("scenes/main_menu")
  scm.init(menu)
end

function love.keypressed(key, scancode, isrepeat)
  print(key, scancode, isrepeat)
  -- if key == "rctrl" then debug.debug() end
end
