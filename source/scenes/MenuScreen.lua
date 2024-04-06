-- adding GameOverScene to test

import "GameOver"
import "Game"
local pd <const> = playdate
local gfx <const> = playdate.graphics


class("MenuScreen").extends(gfx.sprite)

function MenuScreen:init()
    local backgroundImage = gfx.image.new("images/far.png")
    local secondBackgroundImage = gfx.image.new("images/sand.png")
    -- gfx.drawText("Press A to start",100, 100,font)

    resizedImage = self:resizeBgImg(backgroundImage)
    resizedSecond = self:resizeBgImg(secondBackgroundImage)

    gfx.sprite.setBackgroundDrawingCallback(function()
        gfx.image.draw(resizedImage, 0, 100)
        gfx.image.draw(resizedSecond, 0, 120)
        -- gfx.drawText("Crank")
        gfx.drawText("CrankCatch",140, 70,font)
        gfx.drawText("Press A to start",130, 120,font)

    end)
    self:add()
end

function MenuScreen:resizeBgImg(image)
    w,h = image:getSize()
    return image:scaledImage(400/w,240/h)

end
function MenuScreen:update()
 
    if pd.buttonJustPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(Game)
    end
end

