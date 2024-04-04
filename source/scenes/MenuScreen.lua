-- adding GameOverScene to test

import "GameOver"

local pd <const> = playdate
local gfx <const> = playdate.graphics

class("MenuScreen").extends(gfx.sprite)

function MenuScreen:init()
    local backgroundImage = gfx.image.new("images/far.png")
    -- backgroundImage:resize(400,240)
    w,h = backgroundImage:getSize()
    resizedImage = backgroundImage:scaledImage(400/w,240/h)

    gfx.sprite.setBackgroundDrawingCallback(function()
        gfx.image.draw(resizedImage, 0, 0)
    end)
    -- gfx.pushContext(backgroundImage)

    self:add()

    
end

function MenuScreen:update()
    -- gfx.sprite.update() -- Update all sprites

    -- if we press A button take us to GameOverScene
    if pd.buttonJustPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(GameOver,"YAOOAO")
    end
end