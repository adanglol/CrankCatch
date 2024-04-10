
import "CoreLibs/animation"
import "CoreLibs/sprites"

local pd <const> = playdate
local gfx <const> = playdate.graphics

-- Loading our animation in form of gif and put in imagetable for each action
local idleSheet = gfx.imagetable.new("images/gifs/idle.gif")
local walkSheet = gfx.imagetable.new("images/gifs/walk.gif")
local attackSheet = gfx.imagetable.new("images/gifs/attack.gif")
local fishSheet = gfx.imagetable.new("images/gifs/fish.gif")
local hookSheet = gfx.imagetable.new("images/gifs/hook.gif")
local hurtSheet = gfx.imagetable.new("images/gifs/hurt.gif")
local deathSheet = gfx.imagetable.new("images/gifs/death.gif")
local rowSheet = gfx.imagetable.new("images/gifs/row.gif")


-- Creating an animation loop for each action
local idle = gfx.animation.loop.new(500,idleSheet,true)
local walk = gfx.animation.loop.new(500,walkSheet,true)
local attack = gfx.animation.loop.new(500,attackSheet,true)
local fish = gfx.animation.loop.new(500,fishSheet,true)
local hook = gfx.animation.loop.new(500,hookSheet,true)
local hurt = gfx.animation.loop.new(500,hurtSheet,true)
local death = gfx.animation.loop.new(500,deathSheet,true)
local row = gfx.animation.loop.new(500,rowSheet,true)


class("Player").extends(gfx.sprite)

function Player:init(x, y)
    Player.super.init(self,idle)
    self:moveTo(x, y)
    self:setCollideRect(5,15,20,35)
    self:setImage(idle:image())

    self:add()
end
function Player:update(dt)
    -- print("player")
    -- print(idleSheet:getLength())
    self:setImage(idle:image())
   
    -- input to move player
    if pd.buttonIsPressed(pd.kButtonRight) then
        self:setImage(walk:image())
        self:moveBy(5,0)
    end
end



