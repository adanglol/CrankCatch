import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/animation"


-- import our SceneManger
import "scenes/SceneManager"

-- import our scenes
import "scenes/MenuScreen"
import "scenes/Game"


-- make variable referes to playdate so we dont repeat code and makes it easier to read
local pd <const> = playdate
-- make variable call gfx to refer to playdate graphics so we dont repeat code and makes it easier to read
local gfx <const> = playdate.graphics

-- Set an instance of our SceneManager class like singleton
SCENE_MANAGER = SceneManager()
-- local frameTime = 200
-- local idleSheet = gfx.imagetable.new("images/fisher/idle.gif")
-- local idle = gfx.animation.loop.new(frameTime,idleSheet,true)

-- Load Our first scene in the game
-- MenuScreen()
Game()
-- print(idleSheet)

function pd.update()
    -- updates all the timers
    pd.timer.updateTimers()
    -- updates all the sprites update function
    gfx.sprite.update()

    -- idle:draw(0,0)
end