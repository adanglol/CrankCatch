

local pd <const> = playdate
local gfx <const> = playdate.graphics

class("Game").extends(gfx.sprite)

function Game:init()
  

    gfx.sprite.setBackgroundDrawingCallback(function()
       
        gfx.drawText("GAME",130, 120)

    end)
    

    -- gfx.pushContext(backgroundImage)
    self:add()
end