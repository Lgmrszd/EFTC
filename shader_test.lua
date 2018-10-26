local lib = {}

function lib.load()
    my_sh = love.graphics.newShader("shader_test2.glsl")
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    im = love.graphics.newImage("test.png")
end

local function draw_grid()
  love.graphics.setColor(0.8, 0.8, 0.8, 1)
  for i = 0, width, 100 do
    love.graphics.rectangle("fill", i-5, 0, 10, height)
  end
  for i = 0, height, 100 do
    love.graphics.rectangle("fill", 0, i-5, width, 10)
  end
end

local function draw()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setShader(my_sh)
  love.graphics.draw(im, 0, 0)
  draw_grid()
  love.graphics.setShader()
end

function lib.draw()
end

return lib
