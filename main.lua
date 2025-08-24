local love = require("love")

local game = {
    state = {
        menu = true,
        paused = false,
        running = false,
        ended = false
    }

}
local player = {
    radius = 30,
    x = 30,
    y = 30
}
function love.load()
    love.mouse.setVisible(false)
end

function love.update()
    player.x, player.y = love.mouse.getPosition()
end

function love.draw()
    love.graphics.printf("FPS:"..love.timer.getFPS(),love.graphics.newFont(16),10,10,love.graphics.getWidth())
    if game.state["running"] then
        love.graphics.circle("fill", player.x, player.y, player.radius )
    end
    if not game.state["running"] then
        love.graphics.circle("fill", player.x, player.y, player.radius/2 )
    end

end
