local love = require("love")

function Enemy()
    local dice = math.random(1,4)
    local _x , _y
    local _radius = 20

    if dice == 1 then
        _x = math.random(_radius,love.graphics.getWidth())
        y = -_radius * 4

    elseif dice == 2 then
        _x = -_radius * 4
        y = math.random(_radius,love.graphics.getHeight())

    elseif dice == 3 then
        _x = math.random(_radius,love.graphics.getWidth())
        y = love.graphics.getHeight() + (_radius * 4)
    else
        _x = love.graphics.getWidth() + (_radius * 4)
        y =  math.random(_radius,love.graphics.getHeight())
    end
    return{
        level = 1,
        radius = 20,
        x = _x,
        y = -_x,

        move = function(self , player_x , player_y)
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end
            if player_y - self.y > 0 then
                self.y = self.y + self.level
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level
            end
           
        end,
        
        draw = function(self)
            love.graphics.setColor(1,0,0.5)

            love.graphics.circle("fill",self.x,self.y, self.radius)

            love.graphics.setColor(1,1,1)
        end
    }
end
return Enemy