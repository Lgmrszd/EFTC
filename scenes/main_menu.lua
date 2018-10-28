assets = require("assets")

local scm = require("scenes_manager")
local gui = require("love2d-gui")
local Button = require("love2d-gui.Button")

local main_menu = scm.Scene()

local width = love.graphics.getWidth()
local height = love.graphics.getHeight()
local cs = love.graphics.newCanvas(width, height)
local b_font = assets.fonts.buttons_font

function draw_bg()
  local color = {love.graphics.getColor()}
  -- love.graphics.setColor{0, 0, 0, 1}
  love.graphics.rectangle("fill", 0, 0, width, height)
  love.graphics.setColor{0, 0, 0, 1}
  love.graphics.rectangle("fill", 0, height/2, width, height/2)
  love.graphics.setColor(color)
end

function main_menu:init()
  t = 0
  local b1 = Button()
  b1:resize(800,10)
  b1:move(0, 100)
  b1:set_font(b_font)
  b2 = Button()
  b2:resize(800,10)
  b2:move(0, 150)
  b2:set_font(b_font)
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
  love.graphics.setCanvas(cs)
  draw_bg()
  gui.draw()
  love.graphics.setShader(assets.shaders.borders)
  love.graphics.setCanvas()
  love.graphics.draw(cs)
  love.graphics.setShader()
end

function main_menu:update(dt)
  t = t + dt
  t = t % (assets.config.shader_th*2)
  assets.shaders.borders:send("shift", 5*t)
end

return main_menu
