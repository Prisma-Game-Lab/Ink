local class = require("lib/middleclass")

DialogBox = class('DialogBox')

function DialogBox:initialize(cam, text, position, textSpeed, textScale)
  self.cam = cam
  self.text = text
  self.position = position
  self.textSpeed = textSpeed
  self.textScale = textScale
  self.visibleText = 1

  self:updatePosition()
end

function DialogBox:updatePosition()
  local l, t, w, h = self.cam:getCamera():getVisible()
  if self.position == "top" then
    self.x = l + 5
    self.y = t + 5
    self.w = w - 10
    self.h = 100
  elseif self.position == "bottom" then
    self.x = l + 5
    self.y = t + h - 5 - 100
    self.w = w - 10
    self.h = 100
  end
end

function DialogBox:update(dt)
  self.visibleText = self.visibleText + self.textSpeed * dt
end

function DialogBox:draw()
  self:updatePosition()
  
  if self.visibleText < string.len(self.text)+5 then
    love.graphics.setColor(155, 155, 155, 100)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    love.graphics.setColor(155, 0, 0, 255)
    love.graphics.print(string.sub(self.text, 1, math.floor(self.visibleText)), self.x + 10, self.y + 25, 0, self.textScale, self.textScale)
    love.graphics.setColor(155, 155, 155)
  end
end