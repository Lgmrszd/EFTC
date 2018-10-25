local scm = {}
local scenes = {}

local Scene = {}
Scene.__index = Scene


function Scene.new(_name)
  obj = {name = _name, data = {}}
  setmetatable(obj, Scene)
  scenes[_name] = obj
  return obj
end

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
