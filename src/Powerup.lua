
Powerup = Class{}

function Powerup:init(poweruptype, x, y)
     self.width = 16
     self.height = 16
     -- velocity
     self.dy = 40
     self.dx = 0
     self.x = x
     self.y = y
     -- powerup type and if in play
     self.poweruptype = poweruptype
     self.inplay = true

end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    return true
end


function Powerup:update(dt)

    if self.y < VIRTUAL_HEIGHT then
        self.y = self.y + self.dy * dt
    end

end

function Powerup:render()
    if self.inplay then
        love.graphics.draw(gTextures['main'], gFrames['power'][self.poweruptype], self.x, self.y)
    end
end
