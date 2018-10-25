local scm = require("scenes_manager")
local gui = require("gui")
local Button = require("gui.Button")

b1 = Button()

local main_menu = scm.Scene.new()

function main_menu:draw()
  gui.draw()
end

return main_menu
