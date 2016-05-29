local player = {}

function player:init(field)
  self.x = 300
  self.y = 700
  self.width = 80
  self.height = 80
  self.lane = 1
  self.field = field
end

function player:update(dt)
  self.x = self.x + (self.lane * 100 - self.x) * math.min(dt, 1) * 20
end

function player:keypressed(key)
  if key == 'left' then
    self.lane = self.lane > 1 and self.lane - 1 or self.field.laneCount
  elseif key == 'right' then
    self.lane = self.lane < self.field.laneCount and self.lane + 1 or 1
  end
end

function player:draw()
  love.graphics.rectangle('fill',
    self.x - self.width / 2,
    self.y - self.height / 2,
    self.width, self.height
  )
end

return player
