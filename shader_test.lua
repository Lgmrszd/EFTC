local lib = {}

function lib.load()
    sh_of = love.graphics.newShader("shader_test.glsl")
    my_sh = love.graphics.newShader("shader_test3.glsl")
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    im = love.graphics.newImage("test.png")
    cs = love.graphics.newCanvas(width, height)
    cs2 = love.graphics.newCanvas(width, height)
end

local function draw_grid()
  love.graphics.setColor(0.8, 0.8, 0.8, 1)
  for i = 0, width, 40 do
    love.graphics.rectangle("fill", i-2, 0, 4, height)
  end
  for i = 0, height, 40 do
    love.graphics.rectangle("fill", 0, i-2, width, 4)
  end
  love.graphics.setColor(1, 1, 1, 1)
end

local function draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setShader(my_sh)
  love.graphics.draw(im, 0, 0)
  draw_grid()
  love.graphics.setShader()
end

local function draw_cs()
  love.graphics.setCanvas(cs)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(im, 0, 0)
  draw_grid()
  love.graphics.setShader(my_sh)
  love.graphics.setCanvas()
  love.graphics.draw(cs)
  love.graphics.setShader()
end

function lib.draw()
  draw_cs()
end

return lib
