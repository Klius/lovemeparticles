function love.load()
	local img = love.graphics.newImage('imgs/gafas.png')
  RADIANS = 0
	psystem = love.graphics.newParticleSystem(img, 50)
	psystem:setParticleLifetime(5, 10) -- Particles live at least 2s and at most 5s.
	psystem:setEmissionRate(5)
	psystem:setSizeVariation(1)
	psystem:setLinearAcceleration(-20, -20, 20, 20) -- Random movement in all directions.
	psystem:setColors(255,255,255,255,0, 0, 255, 255, 255, 0, 0, 255,0,255,0,255,0,0,0,0) -- Fade to transparency.
  psystem:setRotation(RADIANS,RADIANS)
  love.mouse.setGrabbed(true)
  love.mouse.setVisible(false)
end
 
function love.draw()
	-- Draw the particle system at the center of the game window.
	love.graphics.draw(psystem)
end
 
function love.update(dt)
	psystem:update(dt)
  local x, y = love.mouse.getPosition()
  psystem:moveTo(x,y)
  psystem:setRotation(RADIANS,RADIANS)
end
function love.wheelmoved(x, y)
    if y > 0 then
      RADIANS = RADIANS + 0.1
    elseif y < 0 then
      RADIANS = RADIANS - 0.1
    end
end