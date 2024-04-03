
local pd <const> = playdate
local gfx <const> = playdate.graphics

class("SceneManager").extends()

function SceneManager:switchScene(scene)
    -- Storing the current scene
    self.newScene = scene

    -- Loading the new scene
    self:loadNewScene()

end

function SceneManager:loadNewScene()
    -- Cleanup the current scene
    self:cleanupScene()

    -- Switch to the new scene calling newScene as a function
    self.newScene()

    

end

function SceneManager:cleanupScene()
    gfx.sprite.removeAll()
    self:removeAllTimers()
    gfx.setDrawOffset(0, 0)
end

-- removing  the timers for scenes can come in handy will add
-- function SceneManage

function SceneManager:removeAllTimers()
    -- local allTimers = pd.timer.getAll()
    local allTimers = pd.timer.allTimers()

    for i, timer in ipairs(allTimers) do
        timer:remove()
    end

end