local assets = {}
assets.fonts = {}
assets.shaders = {}
assets.config = {}

function assets.load_assets()
  assets.fonts.buttons_font = love.graphics.newFont("fonts/pt_mono.ttf",27)
  assets.shaders.borders = love.graphics.newShader("shader_borders.glsl")
  assets.config.shader_th = 3
  assets.shaders.borders:send("thickness", assets.config.shader_th)
end

return assets
