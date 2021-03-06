local Renderer = require "renderer"
local GameLoop = require "gameloop"

require "utilities"
require "tiledmap"

local time = {
    dt = 0.0,
    timer = 0.0,
    ticks = 0,
    fps = 0.0, 
}

Game = {
    Renderer = Renderer,
    GameLoop = GameLoop,

    Time = {
        dt = 0.0,
        timer = 0.0,
        ticks = 0,
        fps = 0.0,
    }
}
 
function love.load()
    local map = loadTiledMap "assets/map1"
    Renderer.add(map)
    GameLoop.add(map)
end

function love.update(dt) 
    time.dt = dt
    time.timer = time.timer + dt
    time.ticks = time.ticks + 1
    time.fps = 1.0 / dt

    Game.Time = Copy(time)

    GameLoop.update(dt)
end

function love.draw()
    Renderer.draw()
end
