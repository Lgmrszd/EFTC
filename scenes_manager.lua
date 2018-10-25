local scm = {}

local Scene = {}
Scene.__index = Scene
setmetatable(Scene, {__call = Scene.new})


function Scene.new()
  obj = {data = {}}
  setmetatable(obj, Scene)
  return obj
end
setmetatable(Scene, {__call = Scene.new})

function Scene:update(dt)
end

function Scene:draw()
end

function Scene:init()
end

function Scene:destroy()
end

function scm.update(dt)
  if not current_scene then
    return
  end
  current_scene:update(dt)
end

function scm.draw()
  if not current_scene then
    return
  end
  current_scene:draw()
end

function scm.activate_scene(scene)
  current_scene = scene
end

scm.Scene = Scene
return scm
