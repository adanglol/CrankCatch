

local pd <const> = playdate
local gfx <const> = playdate.graphics

import "objects/player"


local frameTime = 1000
local idleSheet = gfx.imagetable.new("images/fisher/idle.gif")
local idle = gfx.animation.loop.new(frameTime,idleSheet,true)


class("Game").extends(gfx.sprite)

function Game:init()
    Player(20,120)
    self:add()
end

function Game:update()
    -- print(pd.isCrankDocked())
    -- print(pd.getCrankPosition())
    -- if self.state == GAME_STATE_IDLE then
    --     print("IDLE")
    -- end
    -- self.animtionLoop:draw(0,0)
    -- idle:draw()
    gfx.sprite.update()
end