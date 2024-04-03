import "MenuScreen"

local pd <const> = playdate
local gfx <const> = playdate.graphics

class("GameOver").extends(gfx.sprite)

function GameOver:init()
    local text = "Game Over"
    local gameOverImage = gfx.image.new(gfx.getTextSize(text))
    gfx.pushContext(gameOverImage)
        gfx.drawText(text, 0, 0)
    gfx.popContext()

    local gameOverSprite = gfx.sprite.new(gameOverImage)
    gameOverSprite:moveTo(200, 120)
    gameOverSprite:add()

    self:add()


end


function GameOver:update()
    -- gfx.sprite.update() -- Update all sprites
    -- if we press A button take us to GameOverScene
    if pd.buttonJustPressed(pd.kButtonA) then
        SCENE_MANAGER:switchScene(MenuScreen)
    end
end