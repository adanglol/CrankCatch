
local pd <const> = playdate
local gfx <const> = playdate.graphics

class("SceneManager").extends()

function SceneManager:init()
    -- within our scene manager get reference to transition timers
    self.transitionTime = 1000
    -- check if transition is happening
    self.transitioning = false

end



function SceneManager:switchScene(scene,...)

    if self.transitioning then
        return
    end
    self.transitioning = true
    -- Storing the current scene
    self.newScene = scene

    -- Loading the new scene
    -- self:loadNewScene()

    -- holding arguments for the new scene
    self.sceneArgs = ...
    self:startTransition()

end

function SceneManager:loadNewScene()
    -- Cleanup the current scene
    self:cleanupScene()

    -- Switch to the new scene calling newScene as a function
    self.newScene(self.sceneArgs)
end
-- kicks off the transition between scenes
function SceneManager:startTransition()
    local transitionTimer = self:wipeTransition(0,400)

    -- load new scene after transition
    transitionTimer.timerEndedCallback = function()
        self:loadNewScene()
        transitionTimer = self:wipeTransition(400,0)
        -- calls when the transition is done
        transitionTimer.timerEndedCallback = function()
            self.transitioning = false
        end
    end
    

end

-- creating a transition sprite in between scenes
function SceneManager:createTransitionSprite()
    local filledRect  = gfx.image.new(400,240,gfx.kColorBlack)
    -- local filledRect = gfx.image.new("images/.jpg")
    local transitionSprite = gfx.sprite.new(filledRect)
    transitionSprite:moveTo(200, 120)
    transitionSprite:setZIndex(1000)
    transitionSprite:setIgnoresDrawOffset(true)
    transitionSprite:add()
    return transitionSprite
end

-- creating a fade in transition
function SceneManager:wipeTransition(startValue,endValue)
    local transitionSprite = self:createTransitionSprite()
    transitionSprite:setClipRect(0,0,startValue,240)

    -- creating a timer to animate the transition
    local transitionTimer = pd.timer.new(self.transitionTime,startValue,endValue,pd.easingFunctions.inOutCubic)
    -- every frame timer active this function will call
    transitionTimer.updateCallback = function(timer)
        transitionSprite:setClipRect(0,0,timer.value,240)

    end
    return transitionTimer

    
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