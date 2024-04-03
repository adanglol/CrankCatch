-- adding GameOverScene to test

import "GameOver"

local pd <const> = playdate
local gfx <const> = playdate.graphics

class("MenuScreen").extends(gfx.sprite)

function MenuScreen:init()
    local backgroundImage = gfx.image.new("images/far.png")

    gfx.sprite.setBackgroundDrawingCallback(function()
        gfx.image.draw(backgroundImage, 0, 0)
    end)

    self:add()

    
end

function MenuScreen:update()
    -- gfx.sprite.update() -- Update all sprites

    -- if we press A button take us to GameOverScene
    if pd.buttonJustPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(GameOver)
    end
end