import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"


-- import our SceneManger
import "scenes/SceneManager"

-- import our scenes
import "scenes/MenuScreen"


-- make variable referes to playdate so we dont repeat code and makes it easier to read
local pd <const> = playdate
-- make variable call gfx to refer to playdate graphics so we dont repeat code and makes it easier to read
local gfx <const> = playdate.graphics

-- Set an instance of our SceneManager class like singleton
SCENE_MANAGER = SceneManager()


-- Load Our first scene in the game
MenuScreen()


function pd.update()
    -- updates all the timers
    pd.timer.updateTimers()
    -- updates all the sprites update function
    gfx.sprite.update()

end