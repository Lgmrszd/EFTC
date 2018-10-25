local scm = require("scenes_manager")
local gui = require("gui")
local Button = require("gui.Button")

local main_menu = scm.Scene.new()

function main_menu:init()
  b1 = Button()
  b1:resize(800,10)
  b1:move(0, 100)
  b2 = Button()
  b2:resize(800,10)
  b2:move(0, 150)
  function love.mousemoved(x, y, dx, dy)
    gui.mousemoved(x, y, dx, dy)
    b1:set_text("Cursor pos: "..x.." "..y)
  end
  function love.mousepressed(x, y, button, isTouch)
    gui.mousepressed(x, y, dx, dy)
    b1:set_text("Cursor pressed at: "..x.." "..y)
  end
  function love.mousereleased(x, y, button, isTouch)
    gui.mousereleased(x, y, dx, dy)
    b1:set_text("Cursor released at: "..x.." "..y)
  end
end

function main_menu:draw()
  gui.draw()
end

return main_menu
