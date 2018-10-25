local assets = {}
assets.fonts = {}

function assets.load_assets()
  assets.fonts.buttons_font = love.graphics.newFont("fonts/pt_mono.ttf",27)
end

return assets
