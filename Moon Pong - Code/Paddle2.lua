-- Aman Hafeez
-- Class for creating paddle 

Paddle2 = Class{}

function Paddle2:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dy = 0
end

function Paddle2:update(dt)
    -- math.max here ensures that we're the greater of 0 or the player's
    -- current calculated Y position when pressing up so that we don't
    -- go into the negatives; the movement calculation is simply our
    -- previously-defined paddle speed scaled by dt
    if self.dy < 0 then
        self.y = math.max(0, self.y + self.dy * dt)
    -- similar to before, this time we use math.min to ensure we don't
    -- go any farther than the bottom of the screen minus the paddle's
    -- height (or else it will go partially below, since position is
    -- based on its top left corner)
    else
        self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + self.dy * dt)
    end
end

--[[
    To be called by our main function in `love.draw`, ideally. Uses
    LÖVE2D's `rectangle` function, which takes in a draw mode as the first
    argument as well as the position and dimensions for the rectangle. To
    change the color, one must call `love.graphics.setColor`. As of the
    newest version of LÖVE2D, you can even draw rounded rectangles!
]]
function Paddle2:render()
    Paddle2.image = love.graphics.newImage('MoonStation.png')
    love.graphics.draw(Paddle2.image, self.x-30, self.y, 0, 1.5)
    --love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end